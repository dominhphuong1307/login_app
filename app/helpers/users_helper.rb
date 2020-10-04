module UsersHelper
    def gravatar_for(users)
        gra_id =  Digest::MD5::hexdigest(users.username)
        gra_url = "https://gravatar.com/avatar/#{gra_id}?d=robohash&f=y"
        image_tag(gra_url,alt: users.username, class:"gravatar")
    end
end
