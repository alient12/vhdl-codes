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
static const char *ng0 = "C:/Users/pc/OneDrive/Desktop/aaz manteqi/2/MUX/logic.vhd";
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1306069469_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_3798478767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_43738421_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_1248124681_3212880686_p_0(char *t0)
{
    char t24[16];
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
    int t20;
    char *t21;
    int t23;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned char t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    t1 = (t0 + 2672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(15, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 4835);
    t5 = xsi_mem_cmp(t2, t3, 3U);
    if (t5 == 1)
        goto LAB5;

LAB13:    t6 = (t0 + 4838);
    t8 = xsi_mem_cmp(t6, t3, 3U);
    if (t8 == 1)
        goto LAB6;

LAB14:    t9 = (t0 + 4841);
    t11 = xsi_mem_cmp(t9, t3, 3U);
    if (t11 == 1)
        goto LAB7;

LAB15:    t12 = (t0 + 4844);
    t14 = xsi_mem_cmp(t12, t3, 3U);
    if (t14 == 1)
        goto LAB8;

LAB16:    t15 = (t0 + 4847);
    t17 = xsi_mem_cmp(t15, t3, 3U);
    if (t17 == 1)
        goto LAB9;

LAB17:    t18 = (t0 + 4850);
    t20 = xsi_mem_cmp(t18, t3, 3U);
    if (t20 == 1)
        goto LAB10;

LAB18:    t21 = (t0 + 4853);
    t23 = xsi_mem_cmp(t21, t3, 3U);
    if (t23 == 1)
        goto LAB11;

LAB19:
LAB12:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4744U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 4760U);
    t7 = ieee_p_2592010699_sub_43738421_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t29 = *((unsigned int *)t9);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB35;

LAB36:    t10 = (t0 + 3072);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);

LAB4:    xsi_set_current_line(15, ng0);

LAB39:    t2 = (t0 + 2992);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB40;

LAB1:    return;
LAB5:    xsi_set_current_line(16, ng0);
    t25 = (t0 + 1032U);
    t26 = *((char **)t25);
    t25 = (t0 + 4744U);
    t27 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t24, t26, t25);
    t28 = (t24 + 12U);
    t29 = *((unsigned int *)t28);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB21;

LAB22:    t32 = (t0 + 3072);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    memcpy(t36, t27, 8U);
    xsi_driver_first_trans_fast_port(t32);
    goto LAB4;

LAB6:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 4760U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t24, t3, t2);
    t6 = (t24 + 12U);
    t29 = *((unsigned int *)t6);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB23;

LAB24:    t7 = (t0 + 3072);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB4;

LAB7:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4744U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 4760U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t29 = *((unsigned int *)t9);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB25;

LAB26:    t10 = (t0 + 3072);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB8:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4744U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 4760U);
    t7 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t29 = *((unsigned int *)t9);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB27;

LAB28:    t10 = (t0 + 3072);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB9:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4744U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 4760U);
    t7 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t29 = *((unsigned int *)t9);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB29;

LAB30:    t10 = (t0 + 3072);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB10:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4744U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 4760U);
    t7 = ieee_p_2592010699_sub_1306069469_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t29 = *((unsigned int *)t9);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB31;

LAB32:    t10 = (t0 + 3072);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB11:    xsi_set_current_line(16, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 4744U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 4760U);
    t7 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t24, t3, t2, t6, t4);
    t9 = (t24 + 12U);
    t29 = *((unsigned int *)t9);
    t30 = (1U * t29);
    t31 = (8U != t30);
    if (t31 == 1)
        goto LAB33;

LAB34:    t10 = (t0 + 3072);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB4;

LAB20:;
LAB21:    xsi_size_not_matching(8U, t30, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(8U, t30, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(8U, t30, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(8U, t30, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(8U, t30, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(8U, t30, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(8U, t30, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(8U, t30, 0);
    goto LAB36;

LAB37:    t3 = (t0 + 2992);
    *((int *)t3) = 0;
    goto LAB2;

LAB38:    goto LAB37;

LAB40:    goto LAB38;

}


extern void work_a_1248124681_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1248124681_3212880686_p_0};
	xsi_register_didat("work_a_1248124681_3212880686", "isim/MUX_isim_beh.exe.sim/work/a_1248124681_3212880686.didat");
	xsi_register_executes(pe);
}
