function get_sum_dividers(num)
	return sum(filter(x -> num % x == 0, 1:round(Int, num / 2)))
end

function get_sum_dividers_superpos(num, count)
	if (count == 0)
		return num
	else
		return get_sum_dividers_superpos(get_sum_dividers(num), count - 1)
	end
end

function get_answer()
	max_number = 10^5
	iscorrect = ones(Bool, max_number)
	iscorrect[1] = false
	for i in 2:max_number
		if (i % 2 == 1)
			iscorrect[i] = false
			continue
		end
		if (i * 100 / max_number == round(Int, i * 100 / max_number))
			print(i * 100 / max_number)
			println("%")
		end
		s_3 = get_sum_dividers_superpos(i, 3)
		if (s_3 != i)
			iscorrect[i] = false
			continue
		end
		s_5 = get_sum_dividers_superpos(s_3, 2)
		if (s_5 != i)
			iscorrect[i] = false
			continue
		end
		iscorrect[i] = true
	end
	return filter(x -> iscorrect[x], 1:max_number)
end

@time begin
	get_answer()
end
