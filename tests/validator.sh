got="$(cat $1)"
expected="name: valueable_name
image_digest: my-repo/my-image@sha256:d048a282a0dcc753d9416bc29bda673892d8ea3e0344d394fd64105e4975e835"

if [ "$got" = "$expected" ]; then
  echo "Passed"
  exit 0
else
  echo "Failed"
  echo "=== expected ==="
  echo "$expected"
  echo "=== got ==="
  echo "$got"
  echo "====="
  exit 1
fi
