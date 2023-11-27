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

# Include Profile
read -ra PROFILE_LIST <<< $(find ${SCRIPT_HOME}/ -type f -name *.cnf)

# Valid profile exist
if [ ${#PROFILE_LIST} -eq 0 ];then
    echo "Any profile does not exist"
    exit 127
fi

# include all function
for ifunc in $(find ${SCRIPT_HOME}/bin/  -type f) ;do
    . $ifunc
done

# Environment setup

menuDisplay

# exec script as selective profile
. ${SCRIPT_HOME}/etc/$PROFILE

