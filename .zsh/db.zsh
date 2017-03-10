# function something_db() {
#   ssh -f -N -L 35000:something-db-hostname:5432 $1
#   psql -h localhost -p 35000 -U foobar -d baz
#   kill $(ps aux | grep -e '[a]p-northeast-1.rds.amazonaws.com' | awk '{print $2;}')
# }
