function m -d "start email services"
  docker stack deploy --compose-file=$HOME/.dotfiles/email-services/docker-compose.yaml email_services
end
