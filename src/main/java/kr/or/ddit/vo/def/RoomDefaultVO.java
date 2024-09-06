package kr.or.ddit.vo.def;

import java.io.Serializable;
import lombok.Data;

@Data
public class RoomDefaultVO implements Serializable {
    private String roomId;

    private String roomtypeId;

    private Short roomFl;

    private String roomRemark;

    private static final long serialVersionUID = 1L;
}