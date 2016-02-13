/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Andrew/Documents/ISEWorkspace/testgate/MIPS_Processor_ISEProjectFolder/ROM_512x32Bit.vhd";
extern char *STD_TEXTIO;
extern char *STD_STANDARD;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_1879590719_3212880686_p_0(char *t0)
{
    char t16[16];
    char t23[16];
    char t25[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    unsigned char t22;
    char *t24;
    char *t26;
    char *t27;
    int t28;
    int t29;
    int t30;
    int t31;
    int t32;
    int t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;

LAB0:    t1 = (t0 + 3128U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 23056);
    *((int *)t2) = 0;
    t3 = (t0 + 23060);
    *((int *)t3) = 511;
    t4 = 0;
    t5 = 511;

LAB4:    if (t4 <= t5)
        goto LAB5;

LAB7:    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1728U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(41, ng0);
    t2 = (t0 + 2296U);
    t3 = (t0 + 23064);
    t7 = (t16 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 1;
    t8 = (t7 + 4U);
    *((int *)t8) = 11;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t4 = (11 - 1);
    t12 = (t4 * 1);
    t12 = (t12 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t12;
    std_textio_file_open1(t2, t3, t16, (unsigned char)0);
    xsi_set_current_line(42, ng0);

LAB9:    t2 = (t0 + 2296U);
    t17 = std_textio_endfile(t2);
    t18 = (!(t17));
    if (t18 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(60, ng0);

LAB29:
LAB30:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t6 = *((char **)t2);
    t12 = (31 - 8);
    t13 = (t12 * 1U);
    t14 = (0 + t13);
    t2 = (t6 + t14);
    t7 = (t16 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 8;
    t8 = (t7 + 4U);
    *((int *)t8) = 0;
    t8 = (t7 + 8U);
    *((int *)t8) = -1;
    t4 = (0 - 8);
    t35 = (t4 * -1);
    t35 = (t35 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t35;
    t5 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t16);
    t10 = (t5 - 511);
    t35 = (t10 * -1);
    xsi_vhdl_check_range_of_index(511, 0, -1, t5);
    t36 = (32U * t35);
    t37 = (0 + t36);
    t8 = (t3 + t37);
    t9 = (t0 + 3528);
    t15 = (t9 + 56U);
    t24 = *((char **)t15);
    t26 = (t24 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t8, 32U);
    xsi_driver_first_trans_fast_port(t9);
    xsi_set_current_line(62, ng0);

LAB35:    t2 = (t0 + 3448);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB36;

LAB1:    return;
LAB5:    xsi_set_current_line(37, ng0);
    t6 = xsi_get_transient_memory(32U);
    memset(t6, 0, 32U);
    t7 = t6;
    memset(t7, (unsigned char)2, 32U);
    t8 = (t0 + 1968U);
    t9 = *((char **)t8);
    t8 = (t0 + 23056);
    t10 = *((int *)t8);
    t11 = (t10 - 511);
    t12 = (t11 * -1);
    xsi_vhdl_check_range_of_index(511, 0, -1, *((int *)t8));
    t13 = (32U * t12);
    t14 = (0 + t13);
    t15 = (t9 + t14);
    memcpy(t15, t6, 32U);

LAB6:    t2 = (t0 + 23056);
    t4 = *((int *)t2);
    t3 = (t0 + 23060);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB7;

LAB8:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 23056);
    *((int *)t6) = t4;
    goto LAB4;

LAB10:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 2936);
    t6 = (t0 + 2296U);
    t7 = (t0 + 2472U);
    std_textio_readline(STD_TEXTIO, t3, t6, t7);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((int *)t2) = 0;
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 23075);
    *((int *)t2) = 1;
    t3 = (t0 + 23079);
    *((int *)t3) = 8;
    t4 = 1;
    t5 = 8;

LAB13:    if (t4 <= t5)
        goto LAB14;

LAB16:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1728U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t5 = (t4 + 1);
    t2 = (t0 + 1728U);
    t6 = *((char **)t2);
    t2 = (t6 + 0);
    *((int *)t2) = t5;
    goto LAB9;

LAB11:;
LAB14:    xsi_set_current_line(47, ng0);
    t6 = (t0 + 2936);
    t7 = (t0 + 2472U);
    t8 = (t0 + 1488U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    std_textio_read8(STD_TEXTIO, t6, t7, t8);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t18 = *((unsigned char *)t3);
    t19 = ((unsigned char)48 <= t18);
    if (t19 == 1)
        goto LAB20;

LAB21:    t17 = (unsigned char)0;

LAB22:    if (t17 != 0)
        goto LAB17;

LAB19:    t2 = (t0 + 1488U);
    t3 = *((char **)t2);
    t18 = *((unsigned char *)t3);
    t19 = ((unsigned char)97 <= t18);
    if (t19 == 1)
        goto LAB25;

LAB26:    t17 = (unsigned char)0;

LAB27:    if (t17 != 0)
        goto LAB23;

LAB24:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 23083);
    t6 = ((STD_STANDARD) + 384);
    t7 = (t0 + 1728U);
    t8 = *((char **)t7);
    t10 = *((int *)t8);
    t7 = xsi_int_to_mem(t10);
    t9 = xsi_string_variable_get_image(t16, t6, t7);
    t24 = ((STD_STANDARD) + 1008);
    t26 = (t25 + 0U);
    t27 = (t26 + 0U);
    *((int *)t27) = 1;
    t27 = (t26 + 4U);
    *((int *)t27) = 20;
    t27 = (t26 + 8U);
    *((int *)t27) = 1;
    t11 = (20 - 1);
    t12 = (t11 * 1);
    t12 = (t12 + 1);
    t27 = (t26 + 12U);
    *((unsigned int *)t27) = t12;
    t15 = xsi_base_array_concat(t15, t23, t24, (char)97, t2, t25, (char)97, t9, t16, (char)101);
    t27 = (t16 + 12U);
    t12 = *((unsigned int *)t27);
    t13 = (20U + t12);
    xsi_report(t15, t13, (unsigned char)2);

LAB18:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t10 = *((int *)t3);
    t2 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t16, t10, 4);
    t6 = (t0 + 1968U);
    t7 = *((char **)t6);
    t6 = (t0 + 23075);
    t11 = *((int *)t6);
    t28 = (t11 * 4);
    t29 = (35 - t28);
    t12 = (31 - t29);
    t8 = (t0 + 23075);
    t30 = *((int *)t8);
    t31 = (t30 * 4);
    t32 = (32 - t31);
    xsi_vhdl_check_range_of_slice(31, 0, -1, t29, t32, -1);
    t13 = (t12 * 1U);
    t9 = (t0 + 1728U);
    t15 = *((char **)t9);
    t33 = *((int *)t15);
    t34 = (t33 - 511);
    t14 = (t34 * -1);
    xsi_vhdl_check_range_of_index(511, 0, -1, t33);
    t35 = (32U * t14);
    t36 = (0 + t35);
    t37 = (t36 + t13);
    t9 = (t7 + t37);
    t24 = (t16 + 12U);
    t38 = *((unsigned int *)t24);
    t38 = (t38 * 1U);
    memcpy(t9, t2, t38);

LAB15:    t2 = (t0 + 23075);
    t4 = *((int *)t2);
    t3 = (t0 + 23079);
    t5 = *((int *)t3);
    if (t4 == t5)
        goto LAB16;

LAB28:    t10 = (t4 + 1);
    t4 = t10;
    t6 = (t0 + 23075);
    *((int *)t6) = t4;
    goto LAB13;

LAB17:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1488U);
    t7 = *((char **)t2);
    t22 = *((unsigned char *)t7);
    t10 = ((((int)(t22))) - (((int)((unsigned char)48))));
    t2 = (t0 + 1848U);
    t8 = *((char **)t2);
    t2 = (t8 + 0);
    *((int *)t2) = t10;
    goto LAB18;

LAB20:    t2 = (t0 + 1488U);
    t6 = *((char **)t2);
    t20 = *((unsigned char *)t6);
    t21 = (t20 <= (unsigned char)57);
    t17 = t21;
    goto LAB22;

LAB23:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1488U);
    t7 = *((char **)t2);
    t22 = *((unsigned char *)t7);
    t10 = ((((int)(t22))) - (((int)((unsigned char)97))));
    t11 = (t10 + 10);
    t2 = (t0 + 1848U);
    t8 = *((char **)t2);
    t2 = (t8 + 0);
    *((int *)t2) = t11;
    goto LAB18;

LAB25:    t2 = (t0 + 1488U);
    t6 = *((char **)t2);
    t20 = *((unsigned char *)t6);
    t21 = (t20 <= (unsigned char)102);
    t17 = t21;
    goto LAB27;

LAB31:;
LAB32:    goto LAB2;

LAB33:    t3 = (t0 + 3448);
    *((int *)t3) = 0;
    goto LAB29;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

}


extern void work_a_1879590719_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1879590719_3212880686_p_0};
	xsi_register_didat("work_a_1879590719_3212880686", "isim/PROCESSOR_32Bit_tb_isim_beh.exe.sim/work/a_1879590719_3212880686.didat");
	xsi_register_executes(pe);
}
