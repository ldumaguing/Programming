touch main/X.txt ;
echo '// *************** '`date` > main/X.txt ;
echo '// *************************************************************************************************' >> main/X.txt ;

echo '#include <stdio.h>' >> main/X.txt ;
echo '#include <stdint.h>' >> main/X.txt ;
echo '#include <string.h>' >> main/X.txt ;
echo '' >> main/X.txt;
echo '#include "freertos/FreeRTOS.h"' >> main/X.txt ;
echo '#include "freertos/task.h"' >> main/X.txt ;
echo '' >> main/X.txt ;

cat main/ili9341/defines.h >> main/X.txt ;

cat main/ili9341/ILI9341.h >> main/X.txt ;
cat main/ili9341/ILI9341.c >> main/X.txt ;

cat main/main.c >> main/X.txt ;

mv main/X.txt main/Melania.c

