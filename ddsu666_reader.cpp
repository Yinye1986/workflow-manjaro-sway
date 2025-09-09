#include <iostream>
#include <modbus/modbus.h> 
#include <unistd.h>        
#include <csignal>         
#include <cstdlib>         
#include <cstdio>          
#include <cerrno>          

volatile sig_atomic_t keep_running = 1;

void signal_handler(int sig) {
    keep_running = 0;
}

int main() {
    const char *device = "/dev/pts/5"; 
    const int baud = 9600;             
    const char parity = 'N';           
    const int data_bit = 8;            
    const int stop_bit = 1;            
    const int slave_id = 1;
    const int voltage_reg = 0x2000;    
    const int current_reg = 0x2002;    

    modbus_t *ctx = nullptr;
    float voltage = 0.0f;
    float current = 0.0f;
    uint16_t tab_reg[2];

    std::signal(SIGINT, signal_handler);

    ctx = modbus_new_rtu(device, baud, parity, data_bit, stop_bit);
    if (ctx == nullptr) {
        fprintf(stderr, "无法创建 libmodbus context: %s\n", modbus_strerror(errno));
        return -1;
    }

    modbus_set_slave(ctx, slave_id);

    if (modbus_connect(ctx) == -1) {
        fprintf(stderr, "连接到 %s 失败: %s\n", device, modbus_strerror(errno));
        modbus_free(ctx);
        return -1;
    }

    uint32_t old_response_to_sec, old_response_to_usec;
    modbus_get_response_timeout(ctx, &old_response_to_sec, &old_response_to_usec);
    modbus_set_response_timeout(ctx, 0, 500000); // 0秒 500000微秒 = 0.5秒

    printf("成功连接到 %s (地址 %d)\n", device, slave_id);
    printf("开始读取电压和电流... (按 Ctrl+C 退出)\n");

    while (keep_running) {
        modbus_flush(ctx);

        if (modbus_read_registers(ctx, voltage_reg, 2, tab_reg) == 2) {
            voltage = modbus_get_float_abcd(tab_reg); // 根据设备字节序调整 get_float 函数
        } else {
            fprintf(stderr, "读取电压寄存器 (0x%04X) 失败: %s\n", voltage_reg, modbus_strerror(errno));
            voltage = -1.0f; // 标记为无效读取
        }

        if (modbus_read_registers(ctx, current_reg, 2, tab_reg) == 2) {
            current = modbus_get_float_abcd(tab_reg); // 根据设备字节序调整 get_float 函数
        } else {
            fprintf(stderr, "读取电流寄存器 (0x%04X) 失败: %s\n", current_reg, modbus_strerror(errno));
            current = -1.0f; // 标记为无效读取
        }

        printf("\033[2J\033[H");
        printf("--- DDSU666 数据读取 ---\n");
        if (voltage >= 0) {
            printf("电压 (V): %.2f V\n", voltage);
        } else {
            printf("电压 (V): 读取失败\n");
        }
        if (current >= 0) {
            printf("电流 (A): %.3f A\n", current);
        } else {
            printf("电流 (A): 读取失败\n");
        }
        printf("------------------------\n");
        fflush(stdout); // 确保立即输出到终端

        sleep(2); // 每2秒读取一次
    }

    printf("\n收到退出信号，正在关闭连接...\n");

    modbus_close(ctx);
    modbus_free(ctx);

    printf("程序已退出。\n");
    return 0;
}
