module CookiesHelper
  def signed_cookie
    ActionDispatch::Cookies::CookieJar.build(request, cookies.to_hash).signed
  end
end
