class Project < ActiveRecord::Base

	belongs_to :user
	has_many :installments

	before_save :calculate_net_amount
	before_destroy :destroy_project_with_overdue_installments



	validates_presence_of  :title, :total_amount, :discount
	validates_numericality_of :total_amount, :discount
	 



	 def overdue_installments
	 	self.installments.where('status = ? AND installment_date < ?', "scheduled", Date.today)
	 end

	 def paid_installments
	 	self.installments.where('status = ?', "paid")
	 end

	 def scheduled_installments
	 	self.installments.where('status = ? AND installment_date >= ?', "scheduled", Date.today)
	 end


	private

	def calculate_net_amount
		self.net_amount = (self.total_amount) - (self.discount)
	end


	def destroy_project_with_overdue_installments

		if self.installments.where('status = ? ', "overdue").present?
			errors.add(:status, "You cannot destroy a project whose installment is pending")
			return false
		end
	end





end
