module Cricket
	class Base < Grape::API
		mount Cricket::V1::Appdata
	end
end