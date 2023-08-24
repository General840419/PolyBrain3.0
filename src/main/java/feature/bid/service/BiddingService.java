package feature.bid.service;

import core.coreService.CoreService;
import feature.bid.vo.BidEventVo;
import feature.bid.vo.BidItemVo;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface BiddingService extends CoreService {

    // ========== about bidding item ==========
    List<BidItemVo> viewAll();
    public void addAnItem(BidItemVo bidItemVo);

    // ========== about bidding event =========
    List<BidEventVo> viewAllEvent();
    public void addAnEvent(BidEventVo bidEventVo);
    public BidEventVo getEventByNo(Integer bidEventNo);
}
