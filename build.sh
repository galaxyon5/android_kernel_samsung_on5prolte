# fixed settings
export ARCH=arm
export SUBARCH=arm
export CONFIG_NO_ERROR_ON_MISMATCH=y
export CROSS_COMPILE=arm-eabi-
JOBS=-j$(nproc)

# Make changes as per the user
export PATH=/home/arykedare/arm-eabi-4.8/bin:$PATH
export KBUILD_BUILD_USER="aryankedare"
export KBUILD_BUILD_HOST="devilsworkshop"
CONFIG="lineage_on5prolte_defconfig"

 echo "$red *******************************"
                echo "$green*    Compilation in Progress    *"
                echo "$blue *******************************$defcol"
                BUILD_BEGIN=$(date +"%s")
                make $CONFIG
                make $JOBS
                BUILD_TIME=$(date +"%H%M")
                if ![ -e "$IMAGE" ]; then
                echo "$red Error 404: Kernel not compiled."
                echo "Fix the compilation errors! $defcol"
                exit 1; fi;
                BUILD_END=$(date +"%s")
                DIFF=$(($BUILD_END - $BUILD_BEGIN))
                echo "$yellow Build completed in $(($DIFF / 60)) minute(s) and $(($DIFF % 60)) seconds."
