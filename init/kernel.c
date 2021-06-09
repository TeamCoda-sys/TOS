#include "../include/kb.h"
#include "../include/isr.h"
#include "../include/idt.h"
#include "../include/util.h"
#include "../include/ultrashell.h"
kmain()
{
	isr_install();
	clearScreen();
	set_screen_color(15,3);
	print("TOS                                                                             ");
	set_screen_color(15,4);
	print("Make by To Foundation                                                           ");
	print("With TKERNEL !                                                                  ");
	printch('\n');
	set_screen_color(15,0);
    ultrashell(0);    
}