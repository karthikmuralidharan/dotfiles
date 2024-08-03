function deploy_to_dev --description 'Deploy the current local branch to the dev env'
git push origin (git rev-parse --abbrev-ref HEAD):dev --force
end
