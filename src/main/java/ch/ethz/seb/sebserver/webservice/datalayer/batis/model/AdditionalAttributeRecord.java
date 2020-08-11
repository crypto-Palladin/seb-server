package ch.ethz.seb.sebserver.webservice.datalayer.batis.model;

import javax.annotation.Generated;

public class AdditionalAttributeRecord {
    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.id")
    private Long id;

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.entity_type")
    private String entityType;

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.entity_id")
    private Long entityId;

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.name")
    private String name;

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.value")
    private String value;

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source Table: additional_attributes")
    public AdditionalAttributeRecord(Long id, String entityType, Long entityId, String name, String value) {
        this.id = id;
        this.entityType = entityType;
        this.entityId = entityId;
        this.name = name;
        this.value = value;
    }

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.id")
    public Long getId() {
        return id;
    }

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.entity_type")
    public String getEntityType() {
        return entityType;
    }

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.entity_id")
    public Long getEntityId() {
        return entityId;
    }

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.name")
    public String getName() {
        return name;
    }

    @Generated(value="org.mybatis.generator.api.MyBatisGenerator", date="2020-08-11T12:03:38.753+02:00", comments="Source field: additional_attributes.value")
    public String getValue() {
        return value;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table additional_attributes
     *
     * @mbg.generated Tue Aug 11 12:03:38 CEST 2020
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", entityType=").append(entityType);
        sb.append(", entityId=").append(entityId);
        sb.append(", name=").append(name);
        sb.append(", value=").append(value);
        sb.append("]");
        return sb.toString();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table additional_attributes
     *
     * @mbg.generated Tue Aug 11 12:03:38 CEST 2020
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        AdditionalAttributeRecord other = (AdditionalAttributeRecord) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getEntityType() == null ? other.getEntityType() == null : this.getEntityType().equals(other.getEntityType()))
            && (this.getEntityId() == null ? other.getEntityId() == null : this.getEntityId().equals(other.getEntityId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getValue() == null ? other.getValue() == null : this.getValue().equals(other.getValue()));
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table additional_attributes
     *
     * @mbg.generated Tue Aug 11 12:03:38 CEST 2020
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getEntityType() == null) ? 0 : getEntityType().hashCode());
        result = prime * result + ((getEntityId() == null) ? 0 : getEntityId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getValue() == null) ? 0 : getValue().hashCode());
        return result;
    }
}