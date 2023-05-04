# require 'geocoder'
 module Cricket
	module V1
		class Appdata < Grape::API
		include Cricket::V1::Defaults
		format :json
			###################################################################################
			####################      		Home Page Data 			###########################
			###################################################################################

			resource :MainData do
		        desc "Shows MainData"
		        post do
		          begin
		            user = true 
		            if user
		              MainData = []
		              MatchData = Match.all
		              MatchData.each do |match|
		              	MainData << {
		              		"Match-Id":match.id,"Match-Title": match.match_title,"Match-Short-Title": match.match_short_title,"Match-views": match.match_views,"Match-status": match.match_status,
		              		"Team A": Team.find_by(team_name: match.front_team),
		              		"Team B": Team.find_by(team_name: match.opposite_team)
		              	}
		              end
		              {message: 'MSG_SUCCESS', status: 200, MainData: MainData}
		            else
		              {message: 'INVALID_USER', status: 500}
		            end
			        rescue Exception => e
			            puts "API Exception-#{Time.now}-matchListAPI-#{params.inspect}-Error-#{e}"
			            {message: 'MSG_ERROR', status: 500}
			        end
		        end
		    end


		    ###################################################################################
		    ####################    	 On match clickable data 	   ########################
		    ###################################################################################

		    resource :CurrentData do
		        desc "Shows CurrentData"
		        params do
		        	requires :id,type:Integer,allow_blank: false
		        end
		        post do
		          	begin
			            user = true 
			            if user
			        	match = Match.find(params[:id])
			        	CurrentData =[]
			        	T1=[]
			        	T2=[]
				        Team_a_players = Team.find_by(team_name: match.front_team)
				          Team_a_players.players.each do |player|
				          	T1 << {
				          		"player_id": player.id,
				          		"player name": player.player_name
				          	}
				        end 
				        Team_b_players = Team.find_by(team_name: match.opposite_team)
				        Team_b_players.players.each do |player|
				          	T2 << {
				          		"player_id": player.id,
				          		"player name": player.player_name
				          	}
				        end
				        CurrentData = {
				        	"Front Team id": Team_a_players.id ,
				        	"front team": Team_a_players.team_name,
				        	"Team A players": T1,
				        	"Team B players": T2
				        }
		              {message: 'MSG_SUCCESS', status: 200, CurrentData: CurrentData}
		            else
		              {message: 'INVALID_USER', status: 500}
		            end
			        rescue Exception => e
			            puts "API Exception-#{Time.now}-CurrentDataAPI-#{params.inspect}-Error-#{e}"
			            {message: 'MSG_ERROR', status: 500}
			        end
		        end
		    end


		    ###################################################################################
		    ####################     		    Sign up 			###########################
		    ###################################################################################

		    resource :signup do
		        desc "Signup API"
		        params do
		        	# requires :deviceId,type: String,allow_blank: false 
		        	# optional :deviceType,type: String,allow_blank: true 
		        	# optional :deviceName,type: String,allow_blank: true

		        	# requires :socialType,type: String,allow_blank: false  
		        	# requires :socialId,type: String,allow_blank: false 
		        	# optional :socialToken,type: String,allow_blank: false 

		        	requires :socialEmail,type: String,allow_blank: false
		        	optional :referral_code,type: String,allow_blank: true
		        	# optional :socialName,type: String,allow_blank: true
		        	# optional :socialImgUrl,type: String,allow_blank: true

		        	# optional :adverstisiingId,type: String,allow_blank: true 
		        	# requires :versionName,type: String,allow_blank: false 
		        	# requires :versionCode,type: String,allow_blank: false 

		        	# optional :utmSource,type: String,allow_blank: true
		        	# optional :utmMedium,type: String,allow_blank: true
		        	# optional :utmterm,type: String,allow_blank: true
		        	# optional :utmContent,type: String,allow_blank: true
		        	# optional :utmCampaign,type: String,allow_blank: true
		        end


		        post do
		          begin
		            @user=User.where(socialEmail: params[:socialEmail]).first_or_initialize(
		            		deviceId: params[:deviceId],
		            		deviceType: params[:deviceType],
		            		deviceName: params[:deviceName],

		            		socialType: params[:socialType],
		            		socialId: params[:socialId],
		            		socialToken: params[:socialToken],
		            		
		            		securityToken: SecureRandom.uuid(),
		            		
		            		socialEmail: params[:socialEmail],
		            		socialName: params[:socialName],
		            		socialImgUrl: params[:socialImgUrl],
		            		
		            		adverstisiingId: params[:adverstisiingId],
		            		versionName: params[:versionName],
		            		versionCode: params[:versionCode],
		            		
		            		utmSource: params[:utmSource],
		            		utmMedium: params[:utmMedium],
		            		utmterm: params[:utmterm],
		            		utmContent: params[:utmContent],
		            		utmCampaign: params[:utmCampaign]
		            	)
		            @user.save

		            if @user.account.present?
		            	@account = @user.account
		            else
		            	if params[:referral_code].present?
		            		act = Account.find_by(referral_code: params[:referral_code])
		            		act.coins = act.coins+500
		            		act.save!

		            		@account = @user.account = Account.create(user_id: @user.id,coins: 1000,referral_code: SecureRandom.alphanumeric(10))
		            		ph = PointsHistory.create(
		            			"Scheme_Name": "refer Bonus",
		            			"account_id": act.id,
		            			"A_coins": 500,
		            			"Add_type_logo": "https://media.istockphoto.com/id/1210477822/vector/referral-group-icon-vector-isolated-contour-symbol-illustration.jpg?s=612x612&w=0&k=20&c=IMj2tCDHQApRZys-Hi3OuvS65Pxx11LizVRxtvZV_nA="
		            		)
		            		ph = PointsHistory.create(
		            			"Scheme_Name": "Referral Bonus ",
		            			"account_id": @account.id,
		            			"A_coins": 500,
		            			"Add_type_logo": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMSXtMdyr6uXyy8dFzAAC_lWjDNLY6fc0-_w&usqp=CAU"
		            		)
		            		ph = PointsHistory.create(
		            			"Scheme_Name": "SignUp Bonus",
		            			"account_id": @account.id,
		            			"A_coins": 500,
		            			"Add_type_logo": "https://w7.pngwing.com/pngs/438/27/png-transparent-sign-up-register-web-subscribe-membership-enlist-website.png"
		            		)
		            	else
		            		@account = @user.account = Account.create(user_id: @user.id,coins: 500,referral_code: SecureRandom.alphanumeric(10))
		            		ph = PointsHistory.create(
		            			"account_id": @account.id,
		            			"Scheme_Name": "SignUp Bonus",
		            			"A_coins": 500,
		            			"Add_type_logo": "https://previews.123rf.com/images/faysalfarhan/faysalfarhan1605/faysalfarhan160504742/57292278-sign-up-member-icon-glossy-cyan-blue-round-button.jpg"
		            		)
		            	end
		            end
		              {message: 'MSG_SUCCESS', status: 200, user: @user.id,securityToken: @user.securityToken}
			        rescue Exception => e
			            puts "API Exception-#{Time.now}-signup-#{params.inspect}-Error-#{e}"
			            {message: 'MSG_ERROR', status: 500}
			        end
		        end
		    end


		    	###################################################################################
				####################     		   App Open 			###########################
		    	###################################################################################

		    	resource :appOpen do
	            desc "App Open API"
	            # before {api_params}
	            params do
	              requires :userId, type: String, allow_blank: false
	              # requires :versionName, type: String, allow_blank: false
	              # requires :versionCode, type: String, allow_blank: false
	            end
	            post do
	              begin
	                 	user = User.find(params[:userId])
	                 	result = request.location
	                 	ipp = result.ip
	                if user
	                  # source_ip = env['REMOTE_ADDR'] || env['HTTP_X_FORWARDED_FOR']            
	                  # location = source_ip #Geocoder.address(source_ip)            
	                
	                  user.app_opens.new( versionName: params['versionName'], versionCode: params['versionCode'],location: result.city,source_ip: result.ip).save!
	                  {message: MSG_SUCCESS, status: 200,coordinates: result.coordinates }
	                else
	                  {message: INVALID_USER, status: 500}
	                end  
	              rescue Exception => e
	                logger.info "API Exception-#{Time.now}-appOpen-#{params.inspect}-Error-#{e}"
	                {message: MSG_ERROR, status: 500}
	              end
	            end
	          end



	        ###################################################################################
			####################     		   Account	 			###########################
	    	###################################################################################


	    	# resource :account do
	        #     desc "account API"
	        #     # before {api_params}
	        #     params do
	        #       requires :userId, type: String, allow_blank: false
	        #       requires :versionName, type: String, allow_blank: true
	        #       requires :versionCode, type: String, allow_blank: true
	        #       requires :securityToken, type: String,allow_blank: true
	        #     end
	        #     post do
	        #       begin
	        #          	user = User.find(params[:userId])
	        #         if user.present?           
	        #         	if user.account.present?
	        #           @account = user.account
	        #           	else 
	        #           		@account = Account.create(user_id: user.id,  coin: rand(10..100),referral_code: SecureRandom.alphanumeric(10))
	        #           		# @account.user=user
	        #       		end
	        #           {message: MSG_SUCCESS, status: 200 ,account: @account}

	        #         else
	        #           {message: INVALID_USER, status: 500}
	        #         end  
	        #       rescue Exception => e
	        #         logger.info "API Exception-#{Time.now}-appOpen-#{params.inspect}-Error-#{e}"
	        #         {message: MSG_ERROR, status: 500}
	        #       end
	        #     end
	        # end


	    	###################################################################################
			####################     		   Rewards				###########################
	    	###################################################################################

	    	resource :rewards do
	            desc "rewards API"
	            params do
	              requires :userId, type: String, allow_blank: false
	              # requires :versionName, type: String, allow_blank: true
	              # requires :versionCode, type: String, allow_blank: true
	              # requires :securityToken, type: String,allow_blank: true
	            end
	            post do
	              begin
	                 	user = User.find(params[:userId])
	                if user.present?
	                	user_coin = user.account.coins
	                	
	                	Rewards=[]
		              	RewardsData = Reward.all
		              	RewardsData.each do |rew|
			              	Rewards << {
			              		"Reward Id": rew.id,
			              		"Trans Name": rew.Trans_name,
			              		"Trans type": rew.trans_type,
			              		"Trans Logo": rew.trans_logo,
			              		"Coins Amount": rew.coins_amount.split(',').map { | item | item.strip },
			              		"Conversion Amount": rew.conversion_amount.split(',').map { | item | item.strip }
			              	}
		              	end
	                  {message: MSG_SUCCESS, status: 200,coin_present: user_coin ,Rewards: Rewards}
	                else
	                  {message: INVALID_USER, status: 500}
	                end  
	              rescue Exception => e
	                logger.info "API Exception-#{Time.now}-rewards-#{params.inspect}-Error-#{e}"
	                {message: MSG_ERROR, status: 500}
	              end
	            end
	          end

	        ###################################################################################
			####################     	Withdrawl Create			###########################
	    	###################################################################################

	    	resource :withdrawl_req do
	            desc "withdrawl_req API"
	            params do
	              requires :user_id, type: String, allow_blank: false
	              # requires :accounts_id,type: String ,allow_blank: false
	              requires :rewardsId, type: String, allow_blank: false
	              requires :conversion_amount, type: String, allow_blank: false
	              requires :coins_amount, type: String,allow_blank: false
	              requires :trans_logo,type: String,allow_blank: false
	              # requires :trans_type,type:String,allow_blank: false
	            end
	            post do
	              begin
	              	WithDrawData = []
	              	user = User.find(params[:user_id])
	              	reward = Reward.find(params[:rewardsId])
	                if user.present?
	                	actbal = user.account.coins
	                	if actbal >= params[:coins_amount].to_i
	                		Withdraw =  WithdrawlHistory.create(
	                			account_id: user.account.id,
	                			w_coins: params[:coins_amount],
	                			Trans_type_logo: params[:trans_logo],
	                			Transaction_ID: SecureRandom.alphanumeric(15),
	                			transaction_type: reward.trans_type
	                		)
	                		user.account.coins = actbal - params[:coins_amount].to_i
	                		user.account.save!
	                	else 
	                		Withdraw = "Insufficient Balance"
	                	end
	                	WithDrawData << {
	                		accounts_id: Withdraw
	                	}
	                  	{message: MSG_SUCCESS, status: 200,WithDrawData: WithDrawData,"Account Balance": user.account.coins}
	                else
	                  {message: INVALID_USER, status: 500}
	                end  
	              rescue Exception => e
	                logger.info "API Exception-#{Time.now}-withdrawl_req-#{params.inspect}-Error-#{e}"
	                {message: MSG_ERROR, status: 500}
	              end
	            end
	        end


			###################################################################################
			####################     	Withdrawl History			###########################
	    	###################################################################################

	    	resource :WithHist do
	            desc "withdrawl_history API"
	            params do
	              requires :user_id, type: String, allow_blank: false
	              # requires :rewardsId, type: String, allow_blank: false
	              # requires :conversion_amount, type: String, allow_blank: false
	              # requires :coins_amount, type: String,allow_blank: false
	            end
	            post do
	              begin
	              		WH =[]
	                 	user = User.find(params[:user_id])
	                 	u = user.account
	                 	witd = WithdrawlHistory.where(account_id: u.id)
	                	if u.present?
	                	# WithDraw = user.account.withdrawl_histories
	                	# WH << WithDraw
	                		witd.each do|witd|
	                			WH	<< {
				            		"account_id": witd.account_id,
				            		"W_coins": witd.w_coins,
				            		"Trans_type_logo": witd.Trans_type_logo,
				            		"Transaction_ID": witd.Transaction_ID,
				            		"transaction_type": witd.transaction_type,
				            		"Time": witd.created_at.strftime("%d-%m-%Y"),
				            		"Date": witd.created_at.strftime("%I:%M:%S %p")
			            		}
	                		end
	                	
	                  {message: MSG_SUCCESS, status: 200,WH: WH}
	                else
	                  {message: INVALID_USER, status: 500}
	                end  
	              rescue Exception => e
	                logger.info "API Exception-#{Time.now}-WithHist-#{params.inspect}-Error-#{e}"
	                {message: MSG_ERROR, status: 500}
	              end
	            end
	          end


	        ###################################################################################
			####################     	Games List Data				###########################
	    	###################################################################################

	    	resource :games do
	            desc "games API"
	            params do
	              requires :user_id, type: String, allow_blank: false
	              # requires :rewardsId, type: String, allow_blank: false
	              # requires :conversion_amount, type: String, allow_blank: false
	              # requires :coins_amount, type: String,allow_blank: false
	            end
	            post do
	              begin
	                 	user = User.find(params[:user_id])
	                if user.account.present?
	                	
	                	GameList =[]
	                	Gamedata = Game.all
	                	GameSlider =[]
	                	GG = Gamedata.where("gameurl != ?",'')

	                	GG. each do|gg|
		                	GameSlider << {
		                		"Game id ": gg.id,
		                		"Game Url": gg.gameurl,
		                		"Game Img Url": gg.gameimgurl
		                	}
		                end

	                	Gamedata.each do |gg|
	                		GameList << {
	                			"Game id": gg.id,
	                			"Game Name": gg.gamename,
	                			"Game Url": gg.gameurl,
	                			"Game Img Url": gg.gameimgurl,
	                			"Game Amount": gg.gameamt
	                		}
	                	end

	                  {message: MSG_SUCCESS, status: 200,Game: GameList,GameSlder: GameSlider.sample(2)}
	                  # .order(created_at: :desc)
	                else
	                  {message: INVALID_USER, status: 500}
	                end  
	              rescue Exception => e
	                logger.info "API Exception-#{Time.now}-WithHist-#{params.inspect}-Error-#{e}"
	                {message: MSG_ERROR, status: 500}
	              end
	            end
	          end

	        ###################################################################################
			####################     	Task Offers List			###########################
	    	###################################################################################

	    	resource :tasks do
	            desc "tasks API"
	            params do
	            
	            requires :user_id, type: String, allow_blank: false
	              # requires :rewardsId, type: String, allow_blank: false
	              # requires :conversion_amount, type: String, allow_blank: false
	              # requires :coins_amount, type: String,allow_blank: false
	            end
	            post do
	              begin
	                 	user = User.find(params[:user_id])
	                if user.account.present?
	                	
	                	TaskList =[]
	                	Taskdata = Task.all

	                	Taskdata.each do |td|
	                		TaskList << {
	                			"Task id": td.id,
	                			"Task Name": td.taskname,
	                			"Task Img Url": td.taskimgurl,
	                			"Task Amount": td.taskamt,
	                			"Task Val": td.taskval.split(',').map { | item | item.strip }
	                		}
	                	end

	                  {message: MSG_SUCCESS, status: 200,Task: TaskList}
	                  # .order(created_at: :desc)
	                else
	                  {message: INVALID_USER, status: 500}
	                end  
	              rescue Exception => e
	                logger.info "API Exception-#{Time.now}-WithHist-#{params.inspect}-Error-#{e}"
	                {message: MSG_ERROR, status: 500}
	              end
	            end
	          end




	        ###################################################################################
			####################     	spin wheel					###########################
	    	###################################################################################

	    	resource :spin do
	            desc "spin API"

	            params do
	              requires :coins, type: String, allow_blank: false
	              requires :user_id, type: String, allow_blank: false
	            end

	            post do
	            	begin
		            user = User.find(params[:user_id])
		            actbal = user.account.coins
		            
		            if user.present?
			            PH = PointsHistory.create(
			            	"A_coins": params[:coins],
			            	"Add_type_logo": "https://img.freepik.com/premium-vector/bonus-wheel-luck_175250-107.jpg",
			            	"Scheme_Name": "Spin Wheel",
			            	"account_id": user.account.id
			            )
		            	user.account.coins = actbal+params[:coins].to_i
		            	user.account.save!

		            	{message: MSG_SUCCESS, status: 200 ,PointsHistory: PH,current_account_bal: user.account.coins}
		                # .order(created_at: :desc)
		            else
		                  {message: INVALID_USER, status: 500}
		            end  
		              rescue Exception => e
		                puts "API Exception-#{Time.now}-PointsHistory-#{params.inspect}-Error-#{e}"
		                {message: MSG_ERROR, status: 500}
		            end
	           	end
	        end
	        

	        ###################################################################################
			####################     	fantasy 					###########################
	    	###################################################################################

	    	resource :fantasy do
	            desc "fantasy API"

	            params do
	              # requires :coins, type: String, allow_blank: false
	              requires :user_id, type: String, allow_blank: false
	            end

	            post do
	            	begin
		            user = User.find(params[:user_id])
		            fantasyList = []
		            fantasydata = Fantasy.all

		            if user.present?

			            fantasydata.each do |x|
			            	fantasyList << {
			            		"id": x.id,
			            		"Title": x.Title,
			            		"Logo": x.Logo,
			            		"SignUp Bonus": x.signupBonus,
			            		"Minimum Withdrawl": x.Min_withdrawl,
			            		"Withdrawl Type": x.WithdrawlType,
			            		"Refferal Code": x.RefferalCode,
			            		"Task Link": x.TaskLink
			            	}
			            end
		            	
		            	{message: MSG_SUCCESS, status: 200 , FantasyAppData: fantasyList }
		            else
		                  {message: INVALID_USER, status: 500}
		            end  
		              rescue Exception => e
		                puts "API Exception-#{Time.now}-fantasyAPI-#{params.inspect}-Error-#{e}"
		                {message: MSG_ERROR, status: 500}
		            end
	           	end
	        end


	        ###################################################################################
			####################     	Points History				###########################
	    	###################################################################################

	    	resource :pointshistory do
	            desc "pointshistoryAPI"

	            params do
	              # requires :coins, type: String, allow_blank: false
	              requires :user_id, type: String, allow_blank: false
	            end

	            post do
	            	begin
	            	PH=[]
		            user = User.find(params[:user_id])
		            u = user.account
		            hist = PointsHistory.where(account_id: u.id)
		            if u.present?
		            	hist.each do |hist|
			            	PH << {
			            		"A_coins": hist.A_coins,
			            		"account_id": hist.account_id,
			            		"Add_type_logo": hist.Add_type_logo,
			            		"Scheme_Name": hist.Scheme_Name,
			            		"Date": hist.created_at.strftime("%d-%m-%Y"),
			            		"Time": hist.created_at.strftime("%I:%M:%S %p")
			            	}
			            end
		            	{message: MSG_SUCCESS, status: 200 , PH: PH }
		            else
		                  {message: INVALID_USER, status: 500}
		            end  
		              rescue Exception => e
		                puts "API Exception-#{Time.now}-pointshistory-#{params.inspect}-Error-#{e}"
		                {message: MSG_ERROR, status: 500}
		            end
	           	end
	        end

	     	###################################################################################
			####################     	App Invite				###############################
	    	###################################################################################

	    	resource :AppInvite do
	        desc "AppInvite API"
	        before {api_params}

	        params do
	          requires :userId, type: String, allow_blank: false
	          requires :securityToken, type: String, allow_blank: false
	          # requires :versionName, type: String, allow_blank: false
	          # requires :versionCode, type: String, allow_blank: false        
	        end

	        post do
	          begin
	            user = valid_user(params['userId'].to_i, params['securityToken'])
	            if user
	              inviteFbUrl = "https://bankboss.app/invite/#{user.account.referral_code}/?by=facebook"            
	              inviteText = "Share, Invite Friends and Earn CricGuru Coins.\n ► Get 500 CricGuru Coins instant as your Friend Register on CricGuru App.\n ► Get a Chance to Earn upto 10,000 CricGuru Coins for Top Inviters.\n ► Sponsorship for YouTube, WhatsApp, Telegram and Facebook Content Creator Available!"
	              inviteTextUrl = "Download CricGuru App and get free Paypal/Paytm cash upto Rs.500 for OfferTasks, Referral & Games. Click here: https://bankboss.app/invite/#{user.account.referral_code}/?by=social"            
	              {message: MSG_SUCCESS, status: 200, referralCode: user.account.referral_code, currency: '₹', inviteFbUrl: inviteFbUrl, inviteTextUrl: inviteTextUrl, inviteText: inviteText}
	            else
	              {message: INVALID_USER, status: 500}
	            end  

	          	rescue Exception => e
	          	  logger.info "API Exception-#{Time.now}-AppInvite-#{params.inspect}-Error-#{e}"
	          	  {message: MSG_ERROR, status: 500}
	          	end
		      end
		    end


	        ###################################################################################
			####################     		Profile     		###############################
	    	###################################################################################


	    	resource :profile do
	            desc "profile API"

	            params do
	              requires :user_id, type: String, allow_blank: false
	              requires :securityToken, type: String, allow_blank: false
	              optional :actionType, type: String, allow_blank: false
	            end

	            post do
	            	begin
		            user = User.find(params[:user_id])
		            if user
		            	if params['actionType'] == 'post'
		            		profile = Userprofile.where(user_id: user.id).first_or_initialize
		            		if profile.new_record?
		            			Userprofile.update(
		            			userEmail: user.socialEmail,
	            				userName: user.socialName,
	            				phoneNumber: params[:phoneNumber],
	            				DOB: params[:DOB],
	            				Gender: params[:Gender],
	            				profilePic: user.socialImgUrl,
	            				Occupation: params[:Occupation],
	            				Address: params[:Address]
		            		)
		            		profile.save!
		            		else
		            			profile.update(
		            				userEmail: user.socialEmail ,
		            				userName: user.socialName,
		            				profilePic: user.socialImgUrl,
		            				phoneNumber: (params[:phoneNumber].nil? ? profile.phoneNumber : params[:phoneNumber]),
		            				DOB: (params[:DOB].present? ? params[:DOB] : profile.DOB),
		            				Gender:  (params[:Gender].present? ? params[:Gender] : profile.Gender ),
		            				Occupation:  (params[:Occupation].present? ? params[:Occupation] : profile.Occupation),
		            				Address:  (params[:Address].present? ? params[:Address] : profile.Address)
		            			)
		            		end

		            		{message: MSG_SUCCESS, status: 200, msg: 'User Profile Submitted.'}

		            	else 
		            		profile = Userprofile.where(user_id: user.id).first
		            		if profile
		            			{message:MSG_SUCCESS, status: 200, 
		            				userName: user.socialName,
		            				userEmail: user.socialEmail,
		            				phoneNumber: profile.phoneNumber.to_s,
		            				DOB: profile.DOB.to_s,
		            				Gender: profile.Gender.to_s,
		            				profilePic: user.socialImgUrl,
		            				Occupation: profile.Occupation.to_s,
		            				Address: profile.Address.to_s
		            			}
		            		else 
		            			{message: MSG_SUCCESS,status: 200,
		            				userName: user.socialName,
		            				userEmail: user.socialEmail,
		            				phoneNumber: '',
		            				DOB: '',
		            				Gender: '',
		            				profilePic: user.socialImgUrl,
		            				Occupation: '',
		            				Address: ''
		            			}
		            		end
		            	end

		            else
		                  {message: INVALID_USER, status: 500}
		            end  
		              rescue Exception => e
		                puts "API Exception-#{Time.now}-profile API-#{params.inspect}-Error-#{e}"
		                {message: MSG_ERROR, status: 500}
		            end
	           	end
	        end




		end
	end
end
			            	