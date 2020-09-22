#!/bin/bash

# Description: s_and_m_gen.sh generates a seasonal and monthly password wordlist based on the current date. 
# Author: @strupo_ 

# Variables

previous="0" # Default value is the current month. More than 2 is probably a waste of time.
special="!" # Default special character is !, some need escaped like & (just escape them all)
format="sm" # Default format is both season(s) and month(s)
lc="tr [A-Z] [a-z]"

# Arrays

month_year_combos=(
	+%B%Y
	+%B%y
)
year_month_combos=(
	+%Y%B
	+%y%B
)

# Options

while getopts "hf:p:s:" x; do
        case $x in
                h ) 
                echo "Usage: s_and_m_gen.sh (OPTIONS)"
                echo "s_and_m_gen.sh -h        # Display this help message."
                echo "s_and_m_gen.sh           # Default list: PWs based on current month, year, season. Special char: !"
                echo "s_and_m_gen.sh -s\?      # Current month, year, and season. Special char: ?"
                echo "s_and_m_gen.sh -p2       # Same as defaults but includes 2 months back."
                echo "s_and_m_gen.sh -f{m,s}   # m = month(s) only, s = seasonals only, sm = both"
                exit 0;;
                f ) format=$OPTARG;;
                p ) previous=$OPTARG;;
                s ) special=$OPTARG;;
        esac
done

# Functions

function main {
        if [ "$format" == "s" ]; then
                s
                else
                if [ "$format" == "m" ]; then
                        m
                else
                        s_and_m
                fi
        fi
}

function s {
	counter=0
	until [ $counter -gt $previous ];do
                mm=$(date --date="$(date +%Y-%m-15) -$counter month" +%m)
		YYYY=$(date --date="$(date +%Y-%m-15) -$counter month" +%Y)
		YY=$(date --date="$(date +%Y-%m-15) -$counter month" +%y)
                if [[ 10#$mm -ge 3 && 10#$mm -le 5 ]]; then
                        echo Spring$YYYY$special
			echo Spring$YY$special
			echo Spring$YYYY
			echo Spring$YY
                        echo spring$YYYY$special
                        echo spring$YY$special
                        echo spring$YYYY
                        echo spring$YY
                        echo $YYYY"Spring"$special
                        echo $YY"Spring"$special
                        echo $YYYY"Spring"
                        echo $YY"Spring"
                        echo $YYYY"spring"$special
                        echo $YY"spring"$special
                        echo $YYYY"spring"
                        echo $YY"spring"
                else
                        if [[ 10#$mm -ge 6 && 10#$mm -le 8 ]]; then
	                        echo Summer$YYYY$special
	                        echo Summer$YY$special
	                        echo Summer$YYYY
	                        echo Summer$YY
	                        echo summer$YYYY$special
	                        echo summer$YY$special
	                        echo summer$YYYY
	                        echo summer$YY
	                        echo $YYYY"Summer"$special
	                        echo $YY"Summer"$special
	                        echo $YYYY"Summer"
	                        echo $YY"Summer"
	                        echo $YYYY"summer"$special
	                        echo $YY"summer"$special
	                        echo $YYYY"summer"
	                        echo $YY"summer"
                        else
                                if [[ 10#$mm -ge 9 && 10#$mm -le 11 ]]; then
		                        echo Autumn$YYYY$special
	        	                echo Autumn$YY$special
	                	        echo Autumn$YYYY
	                        	echo Autumn$YY
		                        echo autumn$YYYY$special
	        	                echo autumn$YY$special
	                	        echo autumn$YYYY
		                        echo autumn$YY
	        	                echo $YYYY"Autumn"$special
	                	        echo $YY"Autumn"$special
		                        echo $YYYY"Autumn"
	        	                echo $YY"Autumn"
	                	        echo $YYYY"autumn"$special
	                        	echo $YY"autumn"$special
		                        echo $YYYY"autumn"
	        	                echo $YY"autumn"
	                	        echo Fall$YYYY$special
		                        echo Fall$YY$special
	        	                echo Fall$YYYY
	                	        echo Fall$YY
		                        echo fall$YYYY$special
		                        echo fall$YY$special
		                        echo fall$YYYY
		                        echo fall$YY
		                        echo $YYYY"Fall"$special
		                        echo $YY"Fall"$special
		                        echo $YYYY"Fall"
		                        echo $YY"Fall"
		                        echo $YYYY"fall"$special
		                        echo $YY"fall"$special
		                        echo $YYYY"fall"
		                        echo $YY"fall"
                                else
                                        if [[ 10#$mm -ge 12 || 10#$mm -le 2 ]]; then
        			                echo Winter$YYYY$special
			                        echo Winter$YY$special
			                        echo Winter$YYYY
			                        echo Winter$YY
			                        echo winter$YYYY$special
			                        echo winter$YY$special
			                        echo winter$YYYY
			                        echo winter$YY
			                        echo $YYYY"Winter"$special
			                        echo $YY"Winter"$special
			                        echo $YYYY"Winter"
			                        echo $YY"Winter"
			                        echo $YYYY"winter"$special
			                        echo $YY"winter"$special
			                        echo $YYYY"winter"
			                        echo $YY"winter"
                                        fi
                                fi
                        fi
                fi
	counter=$((counter+1))
	done
}

function m {
        counter=0
        until [ $counter -gt $previous ]; do
                for i in ${month_year_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i}$special
                done
                for i in ${month_year_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i}
                done
                for i in ${month_year_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i}$special | $lc
                done
                for i in ${month_year_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i} | $lc
                done
                for i in ${year_month_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i}$special
                done
                for i in ${year_month_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i}
                done
                for i in ${year_month_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i}$special | $lc
                done
                for i in ${year_month_combos[@]}; do
                        date --date="$(date +%Y-%m-15) -$counter month" ${i} | $lc
                done
        counter=$((counter+1))
        done
}

function s_and_m {
        s
        m
}

main
exit 0
