class Synonym < ActiveRecord::Base
  belongs_to :keyword
  attr_accessible :approved, :name

  # Author:
  # 	Mirna Yacout
  # Description:
  # 	This method is to record the aproval of the admin to a certain synonym in the database
  # Parameters:
  # 	id: the id of the synonym to be approved
  # Success:
  # 	returns true on saving the approval correctly in the database
  # Failure:
  # 	returns false if the synonym doesnot exist in the database
  # 	or if the approval failed to be saved in the database 
  class << self
    def approve_synonym(sid)
      if (Synonym.exists?(id: sid))
        synonym = Synonym.find(sid)
        synonym.approved = true
      return synonym.save
      end
      return false
    end
  end
end