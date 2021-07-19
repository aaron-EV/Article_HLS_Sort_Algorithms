-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.1
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity insertionSort is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    indexOutputData : IN STD_LOGIC_VECTOR (7 downto 0);
    operation_V : IN STD_LOGIC_VECTOR (0 downto 0);
    A_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    A_ce0 : OUT STD_LOGIC;
    A_we0 : OUT STD_LOGIC;
    A_d0 : OUT STD_LOGIC_VECTOR (15 downto 0);
    A_q0 : IN STD_LOGIC_VECTOR (15 downto 0);
    A_address1 : OUT STD_LOGIC_VECTOR (7 downto 0);
    A_ce1 : OUT STD_LOGIC;
    A_we1 : OUT STD_LOGIC;
    A_d1 : OUT STD_LOGIC_VECTOR (15 downto 0);
    A_q1 : IN STD_LOGIC_VECTOR (15 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of insertionSort is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "insertionSort,hls_ip_2016_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100tcsg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.484000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=65,HLS_SYN_LUT=79}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (5 downto 0) := "000010";
    constant ap_ST_st3_fsm_2 : STD_LOGIC_VECTOR (5 downto 0) := "000100";
    constant ap_ST_st4_fsm_3 : STD_LOGIC_VECTOR (5 downto 0) := "001000";
    constant ap_ST_st5_fsm_4 : STD_LOGIC_VECTOR (5 downto 0) := "010000";
    constant ap_ST_st6_fsm_5 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv9_100 : STD_LOGIC_VECTOR (8 downto 0) := "100000000";
    constant ap_const_lv9_1FF : STD_LOGIC_VECTOR (8 downto 0) := "111111111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (5 downto 0) := "000001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_21 : BOOLEAN;
    signal operation_V_load_load_fu_106_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_fu_121_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal j_reg_172 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_cseq_ST_st3_fsm_2 : STD_LOGIC;
    signal ap_sig_61 : BOOLEAN;
    signal A_addr_1_reg_180 : STD_LOGIC_VECTOR (7 downto 0);
    signal tmp_1_fu_131_p3 : STD_LOGIC_VECTOR (0 downto 0);
    signal A_addr_2_reg_186 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_fu_149_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_cseq_ST_st5_fsm_4 : STD_LOGIC;
    signal ap_sig_80 : BOOLEAN;
    signal i_i_reg_73 : STD_LOGIC_VECTOR (8 downto 0);
    signal j_0_in_i_reg_85 : STD_LOGIC_VECTOR (8 downto 0);
    signal ap_sig_cseq_ST_st4_fsm_3 : STD_LOGIC;
    signal ap_sig_93 : BOOLEAN;
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_100 : BOOLEAN;
    signal exitcond_i_fu_115_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_0_reg_95 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_fu_110_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_1_i_fu_139_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_4_i_fu_144_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_5_i_fu_155_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal j_cast_fu_127_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_sig_cseq_ST_st6_fsm_5 : STD_LOGIC;
    signal ap_sig_155 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (5 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    i_i_reg_73_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)) and (operation_V_load_load_fu_106_p1 = ap_const_lv1_0))) then 
                i_i_reg_73 <= ap_const_lv9_1;
            elsif (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) and not((ap_const_lv1_0 = tmp_1_fu_131_p3)))) then 
                i_i_reg_73 <= i_fu_149_p2;
            end if; 
        end if;
    end process;

    j_0_in_i_reg_85_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_lv1_0 = exitcond_i_fu_115_p2))) then 
                j_0_in_i_reg_85 <= i_i_reg_73;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then 
                j_0_in_i_reg_85 <= j_reg_172;
            end if; 
        end if;
    end process;

    p_0_reg_95_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_lv1_0 = exitcond_i_fu_115_p2)))) then 
                p_0_reg_95 <= ap_const_lv16_0;
            elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st5_fsm_4)) then 
                p_0_reg_95 <= A_q0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) and (ap_const_lv1_0 = tmp_1_fu_131_p3))) then
                A_addr_1_reg_180 <= tmp_1_i_fu_139_p1(8 - 1 downto 0);
                A_addr_2_reg_186 <= tmp_4_i_fu_144_p1(8 - 1 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then
                j_reg_172 <= j_fu_121_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, operation_V_load_load_fu_106_p1, tmp_1_fu_131_p3, exitcond_i_fu_115_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if ((not((ap_start = ap_const_logic_0)) and not((operation_V_load_load_fu_106_p1 = ap_const_lv1_0)))) then
                    ap_NS_fsm <= ap_ST_st5_fsm_4;
                elsif ((not((ap_start = ap_const_logic_0)) and (operation_V_load_load_fu_106_p1 = ap_const_lv1_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((ap_const_lv1_0 = exitcond_i_fu_115_p2))) then
                    ap_NS_fsm <= ap_ST_st6_fsm_5;
                else
                    ap_NS_fsm <= ap_ST_st3_fsm_2;
                end if;
            when ap_ST_st3_fsm_2 => 
                if (not((ap_const_lv1_0 = tmp_1_fu_131_p3))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st4_fsm_3;
                end if;
            when ap_ST_st4_fsm_3 => 
                ap_NS_fsm <= ap_ST_st3_fsm_2;
            when ap_ST_st5_fsm_4 => 
                ap_NS_fsm <= ap_ST_st6_fsm_5;
            when ap_ST_st6_fsm_5 => 
                ap_NS_fsm <= ap_ST_st1_fsm_0;
            when others =>  
                ap_NS_fsm <= "XXXXXX";
        end case;
    end process;

    A_address0_assign_proc : process(ap_sig_cseq_ST_st1_fsm_0, ap_sig_cseq_ST_st3_fsm_2, A_addr_2_reg_186, ap_sig_cseq_ST_st4_fsm_3, tmp_fu_110_p1, tmp_1_i_fu_139_p1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then 
            A_address0 <= A_addr_2_reg_186;
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then 
            A_address0 <= tmp_1_i_fu_139_p1(8 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) then 
            A_address0 <= tmp_fu_110_p1(8 - 1 downto 0);
        else 
            A_address0 <= "XXXXXXXX";
        end if; 
    end process;


    A_address1_assign_proc : process(ap_sig_cseq_ST_st3_fsm_2, A_addr_1_reg_180, ap_sig_cseq_ST_st4_fsm_3, tmp_4_i_fu_144_p1)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3)) then 
            A_address1 <= A_addr_1_reg_180;
        elsif ((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2)) then 
            A_address1 <= tmp_4_i_fu_144_p1(8 - 1 downto 0);
        else 
            A_address1 <= "XXXXXXXX";
        end if; 
    end process;


    A_ce0_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0, ap_sig_cseq_ST_st3_fsm_2, ap_sig_cseq_ST_st4_fsm_3)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0))) or (ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) or (ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3))) then 
            A_ce0 <= ap_const_logic_1;
        else 
            A_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    A_ce1_assign_proc : process(ap_sig_cseq_ST_st3_fsm_2, ap_sig_cseq_ST_st4_fsm_3)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st3_fsm_2) or (ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3))) then 
            A_ce1 <= ap_const_logic_1;
        else 
            A_ce1 <= ap_const_logic_0;
        end if; 
    end process;

    A_d0 <= A_q0;
    A_d1 <= A_q1;

    A_we0_assign_proc : process(ap_sig_cseq_ST_st4_fsm_3, tmp_5_i_fu_155_p2)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not((ap_const_lv1_0 = tmp_5_i_fu_155_p2))))) then 
            A_we0 <= ap_const_logic_1;
        else 
            A_we0 <= ap_const_logic_0;
        end if; 
    end process;


    A_we1_assign_proc : process(ap_sig_cseq_ST_st4_fsm_3, tmp_5_i_fu_155_p2)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st4_fsm_3) and not((ap_const_lv1_0 = tmp_5_i_fu_155_p2))))) then 
            A_we1 <= ap_const_logic_1;
        else 
            A_we1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_sig_cseq_ST_st6_fsm_5)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_5)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_sig_cseq_ST_st6_fsm_5)
    begin
        if ((ap_const_logic_1 = ap_sig_cseq_ST_st6_fsm_5)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    ap_return <= p_0_reg_95;

    ap_sig_100_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_100 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    ap_sig_155_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_155 <= (ap_const_lv1_1 = ap_CS_fsm(5 downto 5));
    end process;


    ap_sig_21_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_21 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_61_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_61 <= (ap_const_lv1_1 = ap_CS_fsm(2 downto 2));
    end process;


    ap_sig_80_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_80 <= (ap_const_lv1_1 = ap_CS_fsm(4 downto 4));
    end process;


    ap_sig_93_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_93 <= (ap_const_lv1_1 = ap_CS_fsm(3 downto 3));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_21)
    begin
        if (ap_sig_21) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_100)
    begin
        if (ap_sig_100) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st3_fsm_2_assign_proc : process(ap_sig_61)
    begin
        if (ap_sig_61) then 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st3_fsm_2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st4_fsm_3_assign_proc : process(ap_sig_93)
    begin
        if (ap_sig_93) then 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st4_fsm_3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st5_fsm_4_assign_proc : process(ap_sig_80)
    begin
        if (ap_sig_80) then 
            ap_sig_cseq_ST_st5_fsm_4 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st5_fsm_4 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st6_fsm_5_assign_proc : process(ap_sig_155)
    begin
        if (ap_sig_155) then 
            ap_sig_cseq_ST_st6_fsm_5 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st6_fsm_5 <= ap_const_logic_0;
        end if; 
    end process;

    exitcond_i_fu_115_p2 <= "1" when (i_i_reg_73 = ap_const_lv9_100) else "0";
    i_fu_149_p2 <= std_logic_vector(unsigned(i_i_reg_73) + unsigned(ap_const_lv9_1));
        j_cast_fu_127_p1 <= std_logic_vector(resize(signed(j_fu_121_p2),16));

    j_fu_121_p2 <= std_logic_vector(unsigned(j_0_in_i_reg_85) + unsigned(ap_const_lv9_1FF));
    operation_V_load_load_fu_106_p1 <= operation_V;
    tmp_1_fu_131_p3 <= j_fu_121_p2(8 downto 8);
    tmp_1_i_fu_139_p1 <= std_logic_vector(resize(unsigned(j_cast_fu_127_p1),64));
    tmp_4_i_fu_144_p1 <= std_logic_vector(resize(unsigned(j_0_in_i_reg_85),64));
    tmp_5_i_fu_155_p2 <= "1" when (signed(A_q0) > signed(A_q1)) else "0";
        tmp_fu_110_p1 <= std_logic_vector(resize(signed(indexOutputData),64));

end behav;