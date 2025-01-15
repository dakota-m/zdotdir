#!/bin/zsh


response=$(curl -s -X POST "https://api.cloudflare.com/client/v4/zones/77595ffcdf9c5dd9c40f4376b7d92d66/purge_cache" \
  -H "X-Auth-Email: devops@purple.com" \
  -H "Authorization: Bearer LN32JWVAQavZ7t9863-RiQIfUxaBFBai2AoPXwCP" \
  -H "Content-Type: application/json" \
  --data "{\"hosts\": [\"d1hnzlpulgrgsd.cloudfront.net\"]}")
  echo "Response: $response"
  if echo "$response" | jq -e '.success' > /dev/null; then
    echo "Cache purge successful"
  else
    echo "Cache purge failed"
    exit 1
  fi

# vim: set ft=sh ts=2 sw=2 et
