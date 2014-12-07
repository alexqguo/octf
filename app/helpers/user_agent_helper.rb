module UserAgentHelper
	def get_user_agent
		request.env['HTTP_USER_AGENT'].downcase 
	end

	def ua_type
		if /Mobile|iP(hone|od|ad)|Android|BlackBerry|IEMobile|Kindle|NetFront|Silk-Accelerated|(hpw|web)OS|Fennec|Minimo|Opera M(obi|ini)|Blazer|Dolfin|Dolphin|Skyfire|Zune/i.match(get_user_agent)
			"mobile"
		else
			"desktop"
		end
	end
end