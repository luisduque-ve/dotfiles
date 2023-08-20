function n -d "start nvim with custom environment variables"
    env OPENAI_API_KEY=(security find-generic-password -a openai -w) nvim
end
