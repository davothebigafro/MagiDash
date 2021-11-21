#!/bin/bash

BODY=$(curl -s http://localhost:3001/dashboards)
FAILED_TESTS=0

if [[ -z $BODY ]]; then
  echo "it should return at least one dashboard: FAIL" 1>&2
  ((FAILED_TESTS++))
else
  LENGTH=$(echo "$BODY" | jq length)
  if ! [[ $LENGTH -ge 0 ]]; then
    echo "it should return at least one dashboard: FAIL" 1>&2
    ((FAILED_TESTS++))
  else
    echo "it should return at least one dashboard: PASS"
  fi
fi

ID=$(echo "$BODY" | jq '.[0] | .id')
if [[ -z $ID ]]; then
  echo "it should include a numeric id: FAIL" 1>&2
  ((FAILED_TESTS++))
else
  if ! [[ $ID -ge 0 ]]; then
    echo "it should include a numeric id: FAIL" 1>&2
    ((FAILED_TESTS++))
  else
    echo "it should include a numeric id: PASS"
  fi
fi

CREATED_AT=$(echo "$BODY" | jq '.[0] | .createdAt')
if [[ -z $CREATED_AT ]]; then
  echo "it should include a non empty createdAt: FAIL" 1>&2
  ((FAILED_TESTS++))
else
  echo "it should include a non empty createdAt: PASS"
fi

UPDATED_AT=$(echo "$BODY" | jq '.[0] | .updatedAt')
if [[ -z $UPDATED_AT ]]; then
  echo "it should include a non empty updatedAt: FAIL" 1>&2
  ((FAILED_TESTS++))
else
  echo "it should include a non empty updatedAt: PASS"
fi

TITLE=$(echo "$BODY" | jq '.[0] | .title')
if [[ -z $TITLE ]]; then
  echo "it should include a non empty title: FAIL" 1>&2
  ((FAILED_TESTS++))
else
  echo "it should include a non empty title: PASS"
fi

if [[ $FAILED_TESTS -ne 0 ]]; then
  echo
  echo $FAILED_TESTS SMOKE TESTS FAILED
  echo
  echo The api returned the following response
  echo "$BODY" | jq
  echo
  exit 1
fi
