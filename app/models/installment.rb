class Installment < ActiveRecord::Base

	validate :check_extra_payment
	#validate :check_scheduled_installment
	validate :check_date
	belongs_to :project







	private

	def check_extra_payment 
		#total_installment_amount = self.project.installments.sum(:amount) + self.amount
		total_installment_amount = (self.new_record?) ? self.project.installments.sum(:amount) + self.amount :  self.project.installments.sum(:amount)
		if total_installment_amount > self.project.net_amount
			errors.add(:amount, "Payment exceeding your total amount")
		end
	end

	def check_date

		if self.installment_date < Date.today
			errors.add(:installment_date, "Invalid date")
		end
	end



=begin
	def check_scheduled_installment

		if Date.today > (@project.installments.where('status = ?', "scheduled").pluck(:installment_date))
			errors.add(:installment_date, "Your scheduled date has been crossed and will be added to you overdue installments")
			@project.installments.where('status = ?', "overdue").push(self.amount)
		end


	end
=end	
	

end
