module ApplicationHelper

	def month(number) 
		case number
		when 1
			return 'Январь'
		when 2
			return 'Февраль'
		when 3
			return 'Март'
		when 4
			return 'Апрель'
		when 5
			return 'Май'
		when 6
			return 'Июнь'
		when 7
			return 'Июль'
		when 8
			return 'Август'
		when 9
			return 'Сентябрь'
		when 10
			return 'Октябрь'
		when 11
			return 'Ноябрь'
		else 
			return 'Декабрь'
		end
	end

	def smonth(number)
		return month(number)[0..2]
	end

	def days(number)
		case number
		when 1
			return 31
		when 2
			return 28
		when 3
			return 31
		when 4
			return 30
		when 5
			return 31
		when 6
			return 30
		when 7
			return 31
		when 8
			return 31
		when 9
			return 30
		when 10
			return 31
		when 11
			return 30
		else 
			return 31
		end
	end

end
