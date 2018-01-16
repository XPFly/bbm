import static org.springframework.util.ObjectUtils.isEmpty;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
public class Ognl {
    /**
     * 可以用于判断 Map,Collection,String,Array是否不为空
     *
     * @param o
     * @return
     */
    public static boolean isNotEmpty(Object o) {
        return !isEmpty(o);
    }

    /**
     * 可以用于判断Long类型是否不为空
     *
     * @param o
     * @return
     */
    public static boolean isNotEmpty(Long o) {
        return !isEmpty(o);
    }
}
