#!/bin/sh

ESC=$(printf '\033')
RESET="${ESC}[0m"
RED="${ESC}[31m"
GREEN="${ESC}[32m"
BOLD="${ESC}[1m"

ex_file="bsq"
org_path="./bsq_base"
org_ex_file="${org_path}/${ex_file}"
ur_dir="../refactor_bsq/"
ur_ex_file="${ur_dir}${ex_file}"

test_map ()
{
	map_diff="${1}_diff"
	map_full_path="data_map/${1}"
	$org_ex_file $map_full_path > diff1 && $ur_ex_file $map_full_path > diff2 && diff diff1 diff2 > map_diff
	printf "${1} test is "
	if [ ! -s $map_diff ]; then
	# if map_diff is empty
		printf $GREEN
		printf $BOLD
		echo "OK"
		printf $RESET
		rm -f map_diff
	else
		printf $RED
		printf $BOLD
		echo "NG"
		printf $RESET
	fi
}

test_map "map1"
test_map "map1_not_empty"
test_map "map2"
test_map "map3"
test_map "map4"
test_map "map5"
test_map "map8"
test_map "map8_chess"
test_map "map10"
test_map "map10_num"
test_map "map100"
test_map "map100_hukusuu"
test_map "map100_empty"