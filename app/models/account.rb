class Account < ActiveRecord::Base
  class BalanceException < Exception; end
  named_scope :tops, :conditions => 'parent_id IS NULL', :order => :code

  belongs_to :parent, :class_name => 'Account'
  has_many :children, :class_name => 'Account', :foreign_key => :parent_id, :dependent => :destroy, :order => :code

  has_many :from_transactions, :class_name => 'Transaction', :foreign_key => :from_id
  has_many :to_transactions  , :class_name => 'Transaction', :foreign_key => :to_id

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_uniqueness_of :code

  before_save :check_code

  #@@padding = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => 2, 6 => 4 }
  @@padding = { 1 => nil, 2 => nil, 3 => nil, 4 => 2, 5 => 2, 6 => 4 }

  cattr_reader :per_page
  @@per_page = 2

  attr_reader :total

  def history(since = 7.days.ago)
    Transaction.find(:all,
                         :conditions => ['from_id = ? OR to_id = ? AND created_at > ?', self.id, self.id, since],
                         :order => 'created_at DESC')
  end     

  def to_s
    "#{self.code} #{self.name}"
  end

  def total
    @total ||= self.balance + self.balance_crub + self.balance_nqn
  end

  def increase(p)
    self.balance += p[:value].to_f
    self.balance_crub += p[:value_crub].to_f
    self.balance_nqn += p[:value_nqn].to_f
  end

  def decrease(p)
    _total = p.values.reduce{|x,y|x.to_f+y.to_f}
    self.balance -= _total
  end

  def level
    return 1 unless self.parent
    self.code.present? ? self.code.count('.') + 1 : self.parent.level + 1
  end

  def pad(s)
    if @@padding[self.level].nil?
      s.to_s
    else
      sprintf( "%0#{@@padding[self.level]}d", s)
    end
  end

  def parent_prefix
    self.parent.present? ? self.parent.code + '.' : ''
  end

  def check_code    # make sure we have a sensible code, and if not create one
    # a code is sensible if it contains our parent's code plus a dot and a
    # string
    if self.code.blank? || self.code !~ /^#{self.parent_prefix}\d+$/
      self.create_code
    end
  end

  def create_code
    _coll = self.parent.present? ? self.parent.children : self.class.tops
    _code = self.pad( _coll.empty? ? 1 : _coll[-1].code.sub(/.*\./,'').to_i + 1 )
    self.code = self.parent_prefix + _code
  end
end
