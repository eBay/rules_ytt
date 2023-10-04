got="$(cat $1)"
expected="name: valueable_name
image_digest: my-repo/my-image@sha256:49ccf25a1e2c66eef80a5fd75eeb18aec33a2c665da6ecc82d8e022cda10babe"

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
