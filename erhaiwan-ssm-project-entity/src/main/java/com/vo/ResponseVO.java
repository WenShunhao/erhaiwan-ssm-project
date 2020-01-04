package com.vo;

import lombok.Builder;
import lombok.Data;

/**
 * @author nfs
 * @date 2019/12/13
 */
@Data
@Builder
public class ResponseVO {
    private String code;
    private String msg;
    private Object data;


}
