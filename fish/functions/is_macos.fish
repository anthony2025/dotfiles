function is_macos --description "exits with 0 if true and with 1 otherwise"
    test (uname) = Darwin
end
