function aws_profile
    if test (count $argv) -ne 1
        echo "Usage: aws_profile <profile-name>"
        return 1
    end
    set profile_name $argv[1]
    eval (aws configure export-credentials --profile $profile_name --format env)
end
