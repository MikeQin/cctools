#!/usr/bin/env bash

echo "🔒 SECURITY VALIDATION"

ERRORS=0

# 1. Check for exposed secrets
echo "Checking for exposed secrets..."
if grep -r "NEXTAUTH_SECRET=your-secret-key" . --exclude-dir=.git --exclude-dir=node_modules --exclude="*.md"; then
  echo "❌ Found default NEXTAUTH_SECRET"
  ERRORS=$((ERRORS + 1))
fi

if grep -r "API_KEY=test" . --exclude-dir=.git --exclude-dir=node_modules --exclude="*.md"; then
  echo "❌ Found test API keys"
  ERRORS=$((ERRORS + 1))
fi

# 2. Check for SQL injection vulnerabilities
echo "Checking for SQL injection patterns..."
if grep -r "execute.*%" backend/ | grep -v "parameterized" | grep -v ".md"; then
  echo "⚠️ Potential SQL injection vulnerability detected"
  ERRORS=$((ERRORS + 1))
fi

# 3. Check for XSS vulnerabilities
echo "Checking for XSS patterns..."
if grep -r "dangerouslySetInnerHTML" frontend/src --exclude-dir=node_modules; then
  echo "⚠️ Found dangerouslySetInnerHTML usage - verify sanitization"
  ERRORS=$((ERRORS + 1))
fi

# 4. Check for exposed environment variables
echo "Checking for exposed environment variables in frontend..."
if grep -r "process.env" frontend/src --include="*.tsx" --include="*.ts" | grep -v "NEXT_PUBLIC_"; then
  echo "⚠️ Found non-public environment variables in frontend code"
  ERRORS=$((ERRORS + 1))
fi

# 5. Check for weak authentication
echo "Checking authentication configuration..."
if grep -r "NEXTAUTH_SESSION_MAX_AGE=31536000" . --exclude-dir=node_modules; then
  echo "⚠️ Session timeout is 1 year - consider shorter duration"
fi

if [ $ERRORS -gt 0 ]; then
  echo ""
  echo "❌ Security validation FAILED with $ERRORS issue(s)"
  exit 1
fi

echo ""
echo "✅ Security validation PASSED"
exit 0
