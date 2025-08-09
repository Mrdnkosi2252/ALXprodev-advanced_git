#!/bin/bash

echo "1. Checking feature/implement-login..."
git checkout feature/implement-login 2>/dev/null
[ -s "login-page/README.md" ] && echo "✓ PASS: login-page/README.md exists and is not empty" || echo "✗ FAIL: login-page/README.md missing or empty"

echo -e "\n2. Checking develop branch existence..."
git show-ref --verify --quiet refs/heads/develop && echo "✓ PASS: develop branch exists" || echo "✗ FAIL: develop branch missing"

echo -e "\n3. Checking signup-page in develop..."
git checkout develop 2>/dev/null
[ -d "signup-page" ] && [ -s "signup-page/README.md" ] && echo "✓ PASS: signup-page exists with non-empty README" || echo "✗ FAIL: signup-page issue"

echo -e "\n4. Checking login-page in develop..."
[ -d "login-page" ] && [ -s "login-page/README.md" ] && echo "✓ PASS: login-page exists with non-empty README" || echo "✗ FAIL: login-page issue"

echo -e "\n5. Checking main branch signup-page..."
git checkout main 2>/dev/null
[ -d "signup-page" ] && [ -s "signup-page/README.md" ] && echo "✓ PASS: main branch has valid signup-page" || echo "✗ FAIL: main branch signup-page issue"

echo -e "\n6. Verifying README content..."
grep -q "data requirements: email, firstName, lastName, profilePic" "signup-page/README.md" && echo "✓ PASS: README has correct content" || echo "✗ FAIL: README content missing"

echo -e "\nVerification complete!"
