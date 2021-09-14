class Current < ActiveSupport::CurrentAttributes
    attribute :admin
    # makes Current.user accessible in view files.
    attribute :user
  end