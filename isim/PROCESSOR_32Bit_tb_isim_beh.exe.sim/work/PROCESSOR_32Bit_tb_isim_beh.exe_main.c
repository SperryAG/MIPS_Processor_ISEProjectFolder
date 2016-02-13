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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *STD_TEXTIO;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *WORK_P_3440277793;
char *IEEE_P_0774719531;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_3440277793_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_1242562249_init();
    ieee_p_0774719531_init();
    work_a_2110464610_3212880686_init();
    work_a_3166362984_3212880686_init();
    work_a_1879590719_3212880686_init();
    work_a_3841860692_3212880686_init();
    work_a_1800031568_3212880686_init();
    work_a_2352146608_3212880686_init();
    work_a_2065169681_3212880686_init();
    work_a_4071149770_3212880686_init();
    work_a_3506056344_3212880686_init();
    work_a_4094691551_3212880686_init();
    work_a_0114622851_3212880686_init();
    work_a_2248347227_3212880686_init();
    work_a_4056680918_3212880686_init();
    work_a_0354504450_3212880686_init();
    work_a_3019546332_3212880686_init();
    work_a_0180966792_3212880686_init();
    work_a_4167211774_2372691052_init();


    xsi_register_tops("work_a_4167211774_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    WORK_P_3440277793 = xsi_get_engine_memory("work_p_3440277793");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");

    return xsi_run_simulation(argc, argv);

}
