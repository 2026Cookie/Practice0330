package com.wanted.section01;

public class Application {
    public static void main(String[] args) {
        System.out.println("============스프링 없이 객체를 직접 생성해서 사용===========");

        /* hi. 결제 시스템이 있다고 가정을 해본다.
        *   KakaoPay와 NaverPay 가 있으며 Application 에서는
        *   PaymentService를 호출 시 결제 플랫폼 객체를 생성해서
        *   결제가 되는 시나리오를 구성해본다. */

        PaymentService paymentService = new PaymentService
    }
}
