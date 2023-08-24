package feature.bid.dao;

import core.util.HibernateUtil;
import feature.bid.vo.BidItemVo;
import org.hibernate.Session;

import java.util.List;

public class BidItemDaoImpl implements BidItemDao {
    Session session = HibernateUtil.getSessionFactory().getCurrentSession();
    @Override
    public void insert(BidItemVo bidItemVo) {
        session.persist(bidItemVo);
    }
    @Override
    public List<BidItemVo> selectAll() {
        final String hql = "FROM BidItemVo ORDER BY bidItemNo";
        return session
                .createQuery(hql, BidItemVo.class)
                .getResultList();
    }


}
