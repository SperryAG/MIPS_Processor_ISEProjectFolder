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
static const char *ng0 = "C:/Users/Andrew/Documents/ISEWorkspace/testgate/MIPS_Processor_ISEProjectFolder/RAM_512x32Bit.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_1777339480_3212880686_p_0(char *t0)
{
    char t16[16];
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
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    int t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 3720);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t13 = (31 - 8);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t2 = (t5 + t15);
    t8 = (t16 + 0U);
    t11 = (t8 + 0U);
    *((int *)t11) = 8;
    t11 = (t8 + 4U);
    *((int *)t11) = 0;
    t11 = (t8 + 8U);
    *((int *)t11) = -1;
    t19 = (0 - 8);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t11 = (t8 + 12U);
    *((unsigned int *)t11) = t20;
    t21 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t16);
    t22 = (t21 - 0);
    t20 = (t22 * 1);
    xsi_vhdl_check_range_of_index(0, 511, 1, t21);
    t23 = (32U * t20);
    t24 = (0 + t23);
    t11 = (t4 + t24);
    t12 = (t0 + 3880);
    t17 = (t12 + 56U);
    t18 = *((char **)t17);
    t25 = (t18 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t11, 32U);
    xsi_driver_first_trans_fast(t12);

LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)2);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(36, ng0);
    t4 = (t0 + 1512U);
    t11 = *((char **)t4);
    t4 = (t0 + 1352U);
    t12 = *((char **)t4);
    t13 = (31 - 8);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t4 = (t12 + t15);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 8;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t19 = (0 - 8);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t20;
    t21 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t16);
    t22 = (t21 - 0);
    t20 = (t22 * 1);
    t23 = (32U * t20);
    t24 = (0U + t23);
    t18 = (t0 + 3816);
    t25 = (t18 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t11, 32U);
    xsi_driver_first_trans_delta(t18, t24, 32U, 0LL);
    goto LAB9;

}

static void work_a_1777339480_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(42, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 3944);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3736);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1777339480_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1777339480_3212880686_p_0,(void *)work_a_1777339480_3212880686_p_1};
	xsi_register_didat("work_a_1777339480_3212880686", "isim/PROCESSOR_32Bit_isim_beh.exe.sim/work/a_1777339480_3212880686.didat");
	xsi_register_executes(pe);
}
