#
#   HA Auduit mode for Oracle Linux
#   Author: Mr. Muangsoon N.
#   Email:  nukoolmu@ais.co.th
#   Exist: 2023/11/27
#################################################

# SET PORTABLE PATH
SCRIPT_PATH=$(readlink -f ${0})
SCRIPT_NAME=$(basename ${0})
SCRIPT_HOME=$(echo "${SCRIPT_PATH}"|sed "s|/${SCRIPT_NAME}||g")
PROCESS_ID="$$"

TMP_PATH=${SCRIPT_HOME}/tmp

# init script
HOST_INPUT=$(hostname)
IPADDR_INPUT=$(ifconfig |grep -A 1 eth|grep inet|awk -F':' '{print $2}'|awk '{print $1}')

# custom configure
OUT_PUTFILE=${SCRIPT_HOME}/result/${HOST_INPUT}_${IPADDR_INPUT}_$(date +'%Y%m$d_%H%M').csv

# Include Profile
read -ra PROFILE_LIST <<< $(find ${SCRIPT_HOME}/ -type f -name "*.cnf")

# Valid profile exist
if [ ${#PROFILE_LIST} -eq 0 ];then
    echo "Any profile does not exist"
    exit 127
fi



# include all function
for ifunc in $(find ${SCRIPT_HOME}/bin/  -type f -name *.fn) ;do
    . $ifunc
done

# Environment setup

menuDisplay

# exec script as selective profile
. ${SCRIPT_HOME}/etc/$PROFILE
