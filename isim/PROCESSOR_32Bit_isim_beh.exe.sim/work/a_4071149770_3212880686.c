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
static const char *ng0 = "C:/Users/David/Desktop/MIPS_Processor_ISEProjectFolder/REGFILE_32BitX5Bit.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_4071149770_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    int t12;
    int t13;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4448);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 1352U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB16;

LAB17:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 8834);
    *((int *)t4) = 0;
    t11 = (t0 + 8838);
    *((int *)t11) = 31;
    t12 = 0;
    t13 = 31;

LAB11:    if (t12 <= t13)
        goto LAB12;

LAB14:    goto LAB9;

LAB12:    xsi_set_current_line(40, ng0);
    t14 = xsi_get_transient_memory(32U);
    memset(t14, 0, 32U);
    t15 = t14;
    memset(t15, (unsigned char)2, 32U);
    t16 = (t0 + 8834);
    t17 = *((int *)t16);
    t18 = (t17 - 0);
    t19 = (t18 * 1);
    t20 = (32U * t19);
    t21 = (0U + t20);
    t22 = (t0 + 4560);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t14, 32U);
    xsi_driver_first_trans_delta(t22, t21, 32U, 0LL);

LAB13:    t2 = (t0 + 8834);
    t12 = *((int *)t2);
    t4 = (t0 + 8838);
    t13 = *((int *)t4);
    if (t12 == t13)
        goto LAB14;

LAB15:    t17 = (t12 + 1);
    t12 = t17;
    t5 = (t0 + 8834);
    *((int *)t5) = t12;
    goto LAB11;

LAB16:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 2312U);
    t5 = *((char **)t2);
    t2 = (t0 + 1832U);
    t8 = *((char **)t2);
    t2 = (t0 + 7656U);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t8, t2);
    t13 = (t12 - 0);
    t19 = (t13 * 1);
    t20 = (32U * t19);
    t21 = (0U + t20);
    t11 = (t0 + 4560);
    t14 = (t11 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t22 = *((char **)t16);
    memcpy(t22, t5, 32U);
    xsi_driver_first_trans_delta(t11, t21, 32U, 0LL);
    goto LAB9;

}

static void work_a_4071149770_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(47, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t1 = (t0 + 7624U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t4);
    t7 = (32U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 4624);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 4464);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4071149770_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(48, ng0);

LAB3:    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t1 = (t0 + 7640U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    t5 = (t4 - 0);
    t6 = (t5 * 1);
    xsi_vhdl_check_range_of_index(0, 31, 1, t4);
    t7 = (32U * t6);
    t8 = (0 + t7);
    t9 = (t2 + t8);
    t10 = (t0 + 4688);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);

LAB2:    t15 = (t0 + 4480);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4071149770_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4071149770_3212880686_p_0,(void *)work_a_4071149770_3212880686_p_1,(void *)work_a_4071149770_3212880686_p_2};
	xsi_register_didat("work_a_4071149770_3212880686", "isim/PROCESSOR_32Bit_isim_beh.exe.sim/work/a_4071149770_3212880686.didat");
	xsi_register_executes(pe);
}
