package aaa;

public class Test {

    @org.junit.Test
    public void test01(){
        float x = 34.6f;
        float y = 88.8f;
        float sum = x + y;
        String str = Float.toString(sum);

        String aaa = str.substring(0,str.indexOf("."));
        String bbb = str.substring(str.indexOf(".")+ 1 , str.length());


        System.out.println("x + y = " + aaa + "." + bbb);
    }

}
