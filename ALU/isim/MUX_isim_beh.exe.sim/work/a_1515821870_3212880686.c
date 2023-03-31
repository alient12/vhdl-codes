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
static const char *ng0 = "C:/Users/pc/OneDrive/Desktop/aaz manteqi/2/MUX/arithic.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );
char *ieee_p_3620187407_sub_674763465_3965413181(char *, char *, char *, char *, unsigned char );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_1515821870_3212880686_p_0(char *t0)
{
    char t30[16];
    char t34[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    int t17;
    char *t18;
    char *t19;
    int t20;
    char *t21;
    int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t31;
    unsigned int t32;
    unsigned char t33;
    unsigned char t35;

LAB0:    t1 = (t0 + 2832U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(17, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 5112);
    t5 = xsi_mem_cmp(t2, t3, 3U);
    if (t5 == 1)
        goto LAB5;

LAB13:    t6 = (t0 + 5115);
    t8 = xsi_mem_cmp(t6, t3, 3U);
    if (t8 == 1)
        goto LAB6;

LAB14:    t9 = (t0 + 5118);
    t11 = xsi_mem_cmp(t9, t3, 3U);
    if (t11 == 1)
        goto LAB7;

LAB15:    t12 = (t0 + 5121);
    t14 = xsi_mem_cmp(t12, t3, 3U);
    if (t14 == 1)
        goto LAB8;

LAB16:    t15 = (t0 + 5124);
    t17 = xsi_mem_cmp(t15, t3, 3U);
    if (t17 == 1)
        goto LAB9;

LAB17:    t18 = (t0 + 5127);
    t20 = xsi_mem_cmp(t18, t3, 3U);
    if (t20 == 1)
        goto LAB10;

LAB18:    t21 = (t0 + 5130);
    t23 = xsi_mem_cmp(t21, t3, 3U);
    if (t23 == 1)
        goto LAB11;

LAB19:
LAB12:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5020U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 5036U);
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t34, t3, t2, t6, t4);
    t9 = (t0 + 1352U);
    t10 = *((char **)t9);
    t33 = *((unsigned char *)t10);
    t9 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t30, t7, t34, t33);
    t12 = (t30 + 12U);
    t31 = *((unsigned int *)t12);
    t32 = (1U * t31);
    t35 = (8U != t32);
    if (t35 == 1)
        goto LAB31;

LAB32:    t13 = (t0 + 3232);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t9, 8U);
    xsi_driver_first_trans_fast_port(t13);

LAB4:    xsi_set_current_line(17, ng0);

LAB35:    t2 = (t0 + 3152);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB36;

LAB1:    return;
LAB5:    xsi_set_current_line(18, ng0);
    t24 = (t0 + 1032U);
    t25 = *((char **)t24);
    t24 = (t0 + 3232);
    t26 = (t24 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t25, 8U);
    xsi_driver_first_trans_fast_port(t24);
    goto LAB4;

LAB6:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5020U);
    t4 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t30, t3, t2, (unsigned char)3);
    t6 = (t30 + 12U);
    t31 = *((unsigned int *)t6);
    t32 = (1U * t31);
    t33 = (8U != t32);
    if (t33 == 1)
        goto LAB21;

LAB22:    t7 = (t0 + 3232);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB7:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5020U);
    t4 = ieee_p_3620187407_sub_674763465_3965413181(IEEE_P_3620187407, t30, t3, t2, (unsigned char)3);
    t6 = (t30 + 12U);
    t31 = *((unsigned int *)t6);
    t32 = (1U * t31);
    t33 = (8U != t32);
    if (t33 == 1)
        goto LAB23;

LAB24:    t7 = (t0 + 3232);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB8:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 3232);
    t4 = (t2 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t3, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB9:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 5036U);
    t4 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t30, t3, t2, (unsigned char)3);
    t6 = (t30 + 12U);
    t31 = *((unsigned int *)t6);
    t32 = (1U * t31);
    t33 = (8U != t32);
    if (t33 == 1)
        goto LAB25;

LAB26:    t7 = (t0 + 3232);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB10:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 5036U);
    t4 = ieee_p_3620187407_sub_674763465_3965413181(IEEE_P_3620187407, t30, t3, t2, (unsigned char)3);
    t6 = (t30 + 12U);
    t31 = *((unsigned int *)t6);
    t32 = (1U * t31);
    t33 = (8U != t32);
    if (t33 == 1)
        goto LAB27;

LAB28:    t7 = (t0 + 3232);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB11:    xsi_set_current_line(18, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5020U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 5036U);
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t30, t3, t2, t6, t4);
    t9 = (t30 + 12U);
    t31 = *((unsigned int *)t9);
    t32 = (1U * t31);
    t33 = (8U != t32);
    if (t33 == 1)
        goto LAB29;

LAB30:    t10 = (t0 + 3232);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB20:;
LAB21:    xsi_size_not_matching(8U, t32, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(8U, t32, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(8U, t32, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(8U, t32, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(8U, t32, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(8U, t32, 0);
    goto LAB32;

LAB33:    t3 = (t0 + 3152);
    *((int *)t3) = 0;
    goto LAB2;

LAB34:    goto LAB33;

LAB36:    goto LAB34;

}


extern void work_a_1515821870_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1515821870_3212880686_p_0};
	xsi_register_didat("work_a_1515821870_3212880686", "isim/MUX_isim_beh.exe.sim/work/a_1515821870_3212880686.didat");
	xsi_register_executes(pe);
}
