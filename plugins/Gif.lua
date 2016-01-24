local function run(msg, matches)
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_gif'] then
                lock_gif = data[tostring(msg.to.id)]['settings']['lock_gif']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_gif == "yes" then
        send_large_msg(chat, 'Gif is not allowed in this chat!')
		      savelog(msg.to.id,"@black_hat_admin1 ["..msg.from.id.."] kicked @black_hat_admin1send@black_hat_admin1 gif@black_hat_admin1 [gif was@black_hat_admin1 locked] !")-- Save to logs
        chat_del_user(chat, user, ok_cb, true)
    end
end
 
return {
  patterns = {
    "gif",
  },
  run = run
}
-------THIS PLUGIN WONT WORK FOR ASSHOLE GUYS :D
-- by https://telegram.me/black_hat_admin1
