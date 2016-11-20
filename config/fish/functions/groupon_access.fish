function grant
  ssh -p 8081 login1.snc1 login
end

function revoke
  ssh -p 8081 login1.snc1 login -d
end
