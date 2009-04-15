class Transaction < ActiveRecord::Base
  belongs_to :from, :class_name => 'Account'
  belongs_to :to  , :class_name => 'Account'
  belongs_to :doctipo

  attr_accessor :total
  attr_accessor :value_nqn_pc
  attr_accessor :value_crub_pc

  before_save :calculate_values
  after_save :adjust_balances

  def after_initialize
    if self.new_record?
      self.total ||= 0
      self.value_nqn_pc ||= 10
      self.value_crub_pc ||= 10
    end
  end

  def after_find
    self.total = self.value_nqn + self.value_crub + self.value
    self.value_nqn_pc =  100.0 * ( self.value_nqn / self.total )
    self.value_crub_pc = 100.0 * ( self.value_crub / self.total )
  end

  private
  def adjust_balances
    self.from.decrease( :value => self.value, :value_crub => self.value_crub, :value_nqn => self.value_nqn )
    self.from.save!
    self.to.increase( :value => self.value, :value_crub => self.value_crub, :value_nqn => self.value_nqn )
    self.to.save!
  end

  def calculate_values
    self.total = self.total.to_f
    self.value_crub = self.total * ( self.value_crub_pc.to_f / 100.0 )
    self.value_nqn  = self.total * ( self.value_nqn_pc.to_f  / 100.0 )
    self.value = self.total - self.value_crub - self.value_nqn
  end
end
