#! ruby -KS
# -*- coding: windows-31j -*-
#10人勝負
kane = Array.new(10,100000)
bet = Array.new(10,0)
su = Array.new(10,0)
name = ["プレーヤー","相手１","相手２","相手３","相手４","相手５","相手６","相手７","相手８","相手９"]
a = 0
until a >= 10
	puts "#{name[a]}:#{kane[a]}円"
	a+=1
end
puts "各自100,000円持って開始します。enterを押すと開始します。"
gets
oya = rand(9)
flg = ""
until flg == 1
	a = 0
	until a >= 10
	if kane[(a+oya)%10] <= 0 then  
#		print "#{name[(a+oya)%10]}はタネ銭切れで不参加\n"
	elsif (a+oya)%10 == 0 && oya != 0 then
		#主人公
		print "いくら賭けますか？"
		bet[(a+oya)%10] = gets.chomp.to_i
		if bet[(a+oya)%10] == 0 then
		bet[(a+oya)%10] = 10000
		end
		puts "#{bet[(a+oya)%10]}円賭けました。\n"
	elsif a == 0 then
		print "#{name[a+oya]}の親番。\n"
	else
		bet[(a+oya)%10] = rand((kane[(a+oya)%10] - 1))+ 1
		print "#{name[(a+oya)%10]}は、#{bet[(a+oya)%10]}円賭けました！！\n"
	 
	end
	a += 1
	end
	gets
	puts "親（#{name[oya]}）のサイコロは" 
	#↓親が振る
	syo = 0
	kai = 0
	until syo >= 10 || kai ==3
		s = Array.new(4,0)
		s[1] = rand(6)+1
		s[2] = rand(6)+1
		s[3] = rand(6)+1
		print "\n#{s[1]}・#{s[2]}・#{s[3]}　"

		if s[1] > s[2]
			s[0] = s[2]
			s[2] = s[1]
			s[1] = s[0]
			s[0] = 0
		end
		if s[2] > s[3]
			s[0] = s[3]
			s[3] = s[2]
			s[2] = s[0]
			s[0] = 0
		end
		if s[1] > s[2]
			s[0] = s[2]
			s[2] = s[1]
			s[1] = s[0]
			s[0] = 0
		end


		if s[1] == s[2] && s[2] == s[3] then
			if s[1] == 1 then
			print "ピンゾロ！！\n"
			syo = 1000
			else
			print "#{s[1]}のぞろ目！！\n"
			syo = s[1] * 100
			end
		elsif s[1] == 4 && s[2] == 5 && s[3] == 6
			print "シゴロ！！\n"
				syo = 456
		elsif s[1] == 1 && s[2] == 2 && s[3] == 3
			print "ヒフミ・・・・\n"
				syo = 123
		elsif s[1] == s[2] || s[1] == s[3] || s[2] == s[3] then
			if s[1] == s[2]
				syo = 10 + s[3].to_i
				print "#{s[3]}の目\n"
			elsif s[1] == s[3]
				syo = 10 + s[2].to_i
				print "#{s[2]}の目\n"
			elsif s[2] == s[3]
				syo = 10 + s[1].to_i
				print "#{s[1]}の目\n"
			else
			print "エラー"
			exit
			end


		else
			print "はずれ・・・\n"
			syo = 0
		end
	kai += 1
	end

	#↑親が振る
	su[oya] = syo
	gets
	a = 0
	until a >= 10
	if kane[(a+oya)%10] >= 1 then
		if a == 0 then
		else
			#↓振れるかチェック
			if su[oya] == 123 || su[oya].to_i >= 200 || su[oya] == 16  || su[oya] == 456 || su[oya] == 11 || su[oya] == 16 || su[oya] == 0 then
				if su[oya].to_i >= 200 || su[oya].to_i == 16  then
				print "無条件で親の勝利!!\n"
					if su[oya] == 1000 then
				    kane[oya] = kane[oya] + bet[(a+oya)%10]*5
						kane[(a+oya)%10] = kane[(a+oya)%10] - bet[(a+oya)%10]*5
					puts "#{name[(a+oya)%10]}から親（#{name[oya]}）へ#{bet[(a+oya)%10]*5}円\n"
					elsif su[oya] == 16 then
				    kane[oya] = kane[oya] + bet[(a+oya)%10]
						kane[(a+oya)%10] = kane[(a+oya)%10] - bet[(a+oya)%10]
					puts "#{name[(a+oya)%10]}から親（#{name[oya]}）へ#{bet[(a+oya)%10]*3}円\n"
					elsif su[oya] == 456 then
				    kane[oya] = kane[oya] + bet[(a+oya)%10]*2
						kane[(a+oya)%10] = kane[(a+oya)%10] - bet[(a+oya)%10]*2
					puts "#{name[(a+oya)%10]}から親（#{name[oya]}）へ#{bet[(a+oya)%10]*2}円\n"
					else
				    kane[oya] = kane[oya] + bet[(a+oya)%10]*2
						kane[(a+oya)%10] = kane[(a+oya)%10] - bet[(a+oya)%10]*2
					puts "#{name[(a+oya)%10]}から親（#{name[oya]}）へ#{bet[(a+oya)%10]*2}円\n"
					end
				else
				print "無条件で親の敗北・・・!!\n"
					if su[oya] == 123 then
				    kane[oya] = kane[oya] - bet[(a+oya)%10]*2
						kane[(a+oya)%10] = kane[(a+oya)%10] + bet[(a+oya)%10]*2
					puts "親（#{name[oya]}）から#{name[(a+oya)%10]}へ#{bet[(a+oya)%10]*2}円\n"
					else
				    kane[oya] = kane[oya] - bet[(a+oya)%10]
						kane[(a+oya)%10] = kane[(a+oya)%10] + bet[(a+oya)%10]
					puts "親（#{name[oya]}）から#{name[(a+oya)%10]}へ#{bet[(a+oya)%10]}円\n"
					end
				end

			else
		#↓子が振る
		syo = 0
		kai = 0
		until syo >= 10 || kai ==3
			s = Array.new(4,0)
			s[1] = rand(6)+1
			s[2] = rand(6)+1
			s[3] = rand(6)+1
			print "\n#{s[1]}・#{s[2]}・#{s[3]}　"

			if s[1] > s[2]
				s[0] = s[2]
				s[2] = s[1]
				s[1] = s[0]
				s[0] = 0
			end
			if s[2] > s[3]
				s[0] = s[3]
				s[3] = s[2]
				s[2] = s[0]
				s[0] = 0
			end
			if s[1] > s[2]
				s[0] = s[2]
				s[2] = s[1]
				s[1] = s[0]
				s[0] = 0
			end


			if s[1] == s[2] && s[2] == s[3] then
				if s[1] == 1 then
				print "ピンゾロ！！\n"
				syo = 1000
				else
				print "#{s[1]}のぞろ目！！\n"
				syo = s[1] * 100
				end
			elsif s[1] == 4 && s[2] == 5 && s[3] == 6
				print "シゴロ！！\n"
					syo = 456
			elsif s[1] == 1 && s[2] == 2 && s[3] == 3
				print "ヒフミ・・・・\n"
					syo = 123
			elsif s[1] == s[2] || s[1] == s[3] || s[2] == s[3] then
				if s[1] == s[2]
					syo = 10 + s[3].to_i
					print "#{s[3]}の目\n"
				elsif s[1] == s[3]
					syo = 10 + s[2].to_i
					print "#{s[2]}の目\n"
				elsif s[2] == s[3]
					syo = 10 + s[1].to_i
					print "#{s[1]}の目\n"
				else
				print "エラー"
				exit
				end


			else
				print "はずれ・・・\n"
				syo = 0
			end
		kai += 1
		end

		#↑子が振る
				su[(a+oya)%10] = syo
				if su[(a+oya)%10] == su[oya] then
				#分け
						puts "親（#{name[oya]}）と#{name[(a+oya)%10]}、同じ目（ワカレ）\n"
				#勝ち
				elsif su[(a+oya)%10] == 1000 || su[(a+oya)%10] == 456 || su[(a+oya)%10].to_i >= 200 || (su[(a+oya)%10] != 123 && su[(a+oya)%10].to_i > su[oya].to_i) then 
					if su[(a+oya)%10] == 1000 then
					    kane[oya] = kane[oya] - bet[(a+oya)%10]*5
							kane[(a+oya)%10] = kane[(a+oya)%10] + bet[(a+oya)%10]*5
						puts "親（#{name[oya]}）から#{name[(a+oya)%10]}へ#{bet[(a+oya)%10]*5}円\n"
					elsif su[(a+oya)%10] == 456 then
					    kane[oya] = kane[oya] - bet[(a+oya)%10]*2
							kane[(a+oya)%10] = kane[(a+oya)%10] + bet[(a+oya)%10]*2
						puts "親（#{name[oya]}）から#{name[(a+oya)%10]}へ#{bet[(a+oya)%10]*2}円\n"
		      elsif su[(a+oya)%10].to_i >= 200 then
					    kane[oya] = kane[oya] - bet[(a+oya)%10]*3
							kane[(a+oya)%10] = kane[(a+oya)%10] + bet[(a+oya)%10]*3
						puts "親（#{name[oya]}）から#{name[(a+oya)%10]}へ#{bet[(a+oya)%10]*3}円\n"
					elsif su[(a+oya)%10].to_i > su[oya].to_i then
					    kane[oya] = kane[oya] - bet[(a+oya)%10]
							kane[(a+oya)%10] = kane[(a+oya)%10] + bet[(a+oya)%10]
						puts "親（#{name[oya]}）から#{name[(a+oya)%10]}へ#{bet[(a+oya)%10]}円\n"
					else
						print "エラー+"
						exit
					end
				else
		#負け
					if su[(a+oya)%10].to_i <= 10 then
					    kane[oya] = kane[oya] + bet[(a+oya)%10]
							kane[(a+oya)%10] = kane[(a+oya)%10] - bet[(a+oya)%10]
					puts "#{name[(a+oya)%10]}から親（#{name[oya]}）へ#{bet[(a+oya)%10]}円\n"
					elsif su[(a+oya)%10] == 123 then
					    kane[oya] = kane[oya] + bet[(a+oya)%10]*2
							kane[(a+oya)%10] = kane[(a+oya)%10] - bet[(a+oya)%10]*2
					puts "#{name[(a+oya)%10]}から親（#{name[oya]}）へ#{bet[(a+oya)%10]*2}円\n"
					elsif su[(a+oya)%10].to_i < su[oya].to_i then
					    kane[oya] = kane[oya] + bet[(a+oya)%10]
							kane[(a+oya)%10] = kane[(a+oya)%10] - bet[(a+oya)%10]
					puts "#{name[(a+oya)%10]}から親（#{name[oya]}）へ#{bet[(a+oya)%10]}円\n"
					else
						print "エラー-"
					end
				end

			end
			
		if kane[(oya+a)%10] <= 0
			puts "#{name[(oya+a)%10]}くん、ドボン！！！(#{kane[(oya+a)%10]}円)"
			gets
		else
		gets
		end
		end

	end

	a += 1
	end
		if kane[oya] <= 0
			puts "#{name[(oya)%10]}くん、ドボン！！！(#{kane[(oya)%10]}円)"
			gets
		end
			if oya == 9
			oya = 0
			else
			oya += 1
			end
		until kane[oya] >= 0
		oya += 1
			if oya >= 9
			oya = 0
			end
		end

	a = 0
	b = 0
	until a >= 10
		if kane[a] > 0 then
			puts "#{name[a]}:#{kane[a]}円"
			c = a
			b += 1
		end
	a+=1
	end

	if b == 1
	print "#{name[c]}!!!おめでとう!!!\n\n\n"
	a = 0
	until a >= 10
			puts "#{name[a]}:#{kane[a]}円"
	a+=1
	end

	exit
	end

end
