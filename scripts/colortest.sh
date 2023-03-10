################################################################################
# Demo of shell colors with ANSI escape sequences
################################################################################
# Template: "\e[X;Y;...;Zm"
# Examples
# - "\e[32m Text \e[0m"
# - "\e[32;44;5m Text \e[0m"
#
# Notes
# - \e[ \033[ \x1b[ are all acceptable escape characters
# - Order of attributes dont matter but they should be separated by ";" and end 
#   with the letter "m"
# - End with '0' to turn all attributes off
#
# References
# - https://en.wikipedia.org/wiki/ANSI_escape_code - see "SGR" section"
# - https://www.shellhacks.com/bash-colors/
# - https://unix.stackexchange.com/questions/274453/is-there-any-objective-benefit-to-escape-sequences-over-tput
################################################################################
echo "256-bit Color Palette"
for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 36 == 0 )); then
        printf "\n";
    fi
done
echo

########################################
echo
echo "8-bit Color Palette SGR parameters"
fg_colors=( "" 30 31 32 33 34 35 36 37) # 39 = default
bg_colors=( ""    41 42 43 44 45 46 47) # 49 = default
echo 'Font (row) and background (column) color'
echo '|-------------------------------------------------------|'
printf "|%10s" ""
for bg in ${bg_colors[@]}; do 
    printf "%6s" "${bg_s}${bg}"; 
done
echo '   |'
echo '|-------------------------------------------------------|'
for fg in "${fg_colors[@]}"; do
    printf "|%6s" "${fg}"
    for bg in "${bg_colors[@]}"; do
        # Combine options into ";" separated string
        opt=""
        if [ -n "$fg" ]; then 
	    [ -n "$opt" ] && opt="${opt};" 
	    opt="${opt}$fg"; 
	fi;
        if [ -n "$bg" ]; then 
	    [ -n "$opt" ] && opt="${opt};" 
	    opt="${opt}$bg"; 
	fi;
        printf " \e[%sm%s\e[0m" "${opt}" " gYw "
    done
    echo ' |'
 done
echo '|-------------------------------------------------------|'

########################################
# Same table using tput setaf and setab
#for fg_color in {0..7}; do
#    set_foreground=$(tput setaf $fg_color)
#    for bg_color in {0..7}; do
#	set_background=$(tput setab $bg_color)
#	echo -n $set_background$set_foreground
#	printf ' F:%s B:%s ' $fg_color $bg_color
#    done
#    echo $(tput sgr0)
#done
#echo '|-------------------------------------------------------|'

########################################
echo 'Other commonly supported SGR display attributes'
styles=( 1 2 3 4 5 6 7 8 9)
fg_bright_colors=( 90  91  92  93  94  95  96  97)
bg_bright_colors=( 100 101 102 103 104 105 106 107)
for s in "${styles[@]}" "${fg_bright_colors[@]}" "${bg_bright_colors[@]}"; do
    #printf "%-3s: \e[${s}m gYw \e[0m\n" "$s"
    printf "[%s] '\e[${s}m gYw \e[0m'; " "$s"
done
echo
echo '|-------------------------------------------------------|'

########################################
echo 'Other rarely supported SGR display attributes'
for s in $(seq 10 29) $(seq 50 75) $seq; do
    printf "[%s] '\e[${s}m gYw \e[0m'; " "$s"
done
echo
echo '|-------------------------------------------------------|'


