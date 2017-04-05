# name: discourse-ubuntu-login
# about: Ubuntu SSO support for Discourse
# version: 0.1
# authors: Sam Saffron, Marco Ceppi, Gustavo

if ENV["DISCOURSE_UBUNTU_LOGIN"] == "true"

auth_provider :title => 'with Ubuntu',
              :authenticator => Auth::OpenIdAuthenticator.new('ubuntu','https://login.ubuntu.com', trusted: true),
              :message => 'Authenticating with Ubuntu (make sure pop up blockers are not enabled)',
              :frame_width => 1000,   # the frame size used for the pop up window, overrides default
              :frame_height => 800

register_css <<CSS

.btn-social.ubuntu {
  background: #772953;
}

.btn-social.ubuntu:before {
  font-family: Ubuntu;
  content: url(https://niemeyer.s3.amazonaws.com/discourse-ubuntu-login-icon.png);
}

CSS

end
