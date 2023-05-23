public class Ti994aCharDecode {
    public static void main(String[] args) {
        if (args.length!=1){
            System.out.println("usage: Ti994aCharDecode patternVal-identifier");
            System.out.println("example: Ti994aCharDecode 00367F7F7F3E1C08");
            System.exit(-1);
        }
        try {
            Long patternVal = Long.parseUnsignedLong(args[0], 16);
            String pattern = String.format("%64s", Long.toBinaryString(patternVal)).replace(' ', '0');
            pattern=pattern.replace('1','*');
            pattern=pattern.replace('0',' ');
            System.out.println("pattern: "+args[0]);
            for (int i=0; i<8; i++){
                for (int j=0; j<8; j++) {
                    System.out.print(pattern.toCharArray()[(i*8)+j]+" ");
                }
                System.out.println();
            }
            System.out.println();
        } catch (NumberFormatException e){
            System.out.println("Error: invalid pattern argument: ["+args[0]+"]");
        }
    }
}