mt.accounts = {};

/**
 *  New account form
 */
mt.accounts.newAccountForm = function() {
    this.form = $("#new-account-form");
    $.ajax({
        data: {
            'authenticity_token' : authenticityToken
        },
        url: account_path("new"),
        type: 'GET',
        dataType: 'html',
        success: function(data) {
            $.facebox(data);
            $('#add-account-button').bind('click', function(event) {
                event.stopPropagation();
                event.preventDefault();
                $.ajax({
                    data: $(this.form).serialize(),
                    url: account_path("create"),
                    type: 'POST',
                    dataType: 'json',
                    success: function(envelope) {
                        if (envelope.ok) {
                            $("div#account-list").load(account_path('refresh'));
                            $.facebox.close();
                        } else {
                            if (envelope.errors) {
                                mt.forms.displayRecordErrors('account', envelope);
                            }
                        }
                    }
                });
            });
        }
    });
    return false;
}

/**
 * Edit account button
 */
mt.accounts.editAccount = function(ev) {
    accountId = mt.accounts.getAccountId($(ev.target));
    this.form = $("#new-account-form");
    $.ajax({
        url: account_path(accountId) + '/edit',
        type: 'GET',
        dataType: 'html',
        success: function(data) {
            $.facebox(data);
            $('#add-account-button').bind('click', function(event) {
                event.stopPropagation();
                event.preventDefault();
                $.ajax({
                    data: $(this.form).serialize(),
                    url: account_path("update"),
                    type: 'POST',
                    dataType: 'json',
                    success: function(envelope) {
                        if (envelope.ok) {
                            $("div#account-list").load(account_path('refresh'));
                            $.facebox.close();
                        } else {
                            if (envelope.errors) {
                                mt.forms.displayRecordErrors('account', envelope);
                            }
                        }
                    }
                });
            });
        }
    });
    return false;

}

/**
 * Handle deleting accounts
 */
mt.accounts.deleteAccount = function(ev) {
    accountId = mt.accounts.getAccountId($(ev.target));
    $.ajax({
        data: {
            'authenticity_token' : authenticityToken,
            'id' : accountId
        },
        url: account_path(accountId),
        type: 'DELETE',
        dataType: 'json',
        beforeSend: function() {
            return confirm("Are you sure you want to delete this account ?")
            },
        success: function(envelope) {
            if (envelope.ok) {
                var accountsContainer = $("div#account-list");
                if (accountsContainer.length > 0) {
                    accountsContainer.load(account_path('refresh'));
                }
            } else {
            // FIXME: handle errors
            }
        }
    });
}

/**
 * Helper function to get account id according to a control icon clicked
 */
mt.accounts.getAccountId = function(element) {
    return element.parents().find("div.account-controls").attr("id").substr(17);
}

/**
 *  Setup all elements
 */
$(document).ready(function() {
    $("a#new-account-link").live('click', mt.accounts.newAccountForm);
    $("a.edit-account-link").live('click', mt.accounts.editAccount);
    $("a.delete-account-link").live('click', mt.accounts.deleteAccount);
});
