class User < ApplicationRecord
    has_many :posts, dependent: :destroy

    validates :name, presence: { message: "Don't you have a name? it must be provided." }
    validates :email, presence: { message: "We need an email to contact you, provide it." }, uniqueness: { message: "That email is used, please use a unique one." }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email format is not valid, check and send it again." }
    validates :password, presence: { message: "We want to assure that your account is safe, please create a password" }, length: { minimum: 6, message: "Password must have at least 6 characters, be more creative!" }

    
end